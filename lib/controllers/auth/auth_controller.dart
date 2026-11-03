import 'package:elearning/models/data_models/remote_db/authrepository.dart';
import 'package:elearning/models/data_models/user_model.dart';
import 'package:elearning/models/local_db/localstorgeservice.dart';
import 'package:elearning/models/local_db/network_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  final ConnectivityService connectivityService;
  final Localstorgeservice localstorgeservice;

  AuthController({
    required this.repository,
    required this.connectivityService,
    required this.localstorgeservice,
  });
  final Rx<UserModel?> _user = Rxn<UserModel>();

  UserModel? get user => _user.value;
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final obscurePhone = true.obs;
  final obscureDadPhone = true.obs;
  final phoneController = TextEditingController();
  final dadPhoneController = TextEditingController();

  final logInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final complationFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    ever(connectivityService.isConnected, (isConnected) {
      isConnected
          ? Get.snackbar('تم الاتصال بالإنترنت', '')
          : Get.snackbar('لا يوجد اتصال بالإنترنت', '');
    });
  }

  Future<void> CheckUserState() async {
    final FirebaseUser=repository.currentUser;
    final localUser = localstorgeservice.getUserData();
    if(FirebaseUser!=null&&localUser!=null){
      _user.value=localUser;
      Get.toNamed('/home');
      await refreshuserData(FirebaseUser.uid);
      return;
    }else{
      localstorgeservice.clearUserData();
      _user.value=null;
      Get.toNamed('/login');
    }
  }
  Future<void> refreshuserData(String userId)async{
    try{
      if (!await connectivityService.check()) {
    return;
  }
  
      final remotUser=await repository.getUser(userId);
      localstorgeservice.setUserData(remotUser);
      _user.value=remotUser;
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }
  }
  Future<void> logout()async{
    try{
      if (!await connectivityService.check()) {
    return;
  }
      await repository.logout();
      localstorgeservice.clearUserData();
      _user.value=null;
      Get.toNamed('/login');
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }
  }
    void toggleObscure() => obscurePassword.toggle();

  Future<void> signup()async{
    try{
      if(!signUpFormKey.currentState!.validate()){
        return;
      }
      if (!await connectivityService.check()) {
    return;
  }

      isLoading.value=true;
      if(passwordController.text!=confirmPasswordController.text){
        throw 'كلمتا المرور غير متطابقتين';
      }
      final user=await repository.signUp(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      localstorgeservice.setUserData(user);
      _user.value=user;
      Get.toNamed('/home');
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }finally{
      isLoading.value=false;
    }
  }
  Future<void> signin()async{
    try{
      if (!await connectivityService.check()) {
    return;
  }
  if(!logInFormKey.currentState!.validate()){
    return;
  }
      isLoading.value=true;
    
      final user=await repository.signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      localstorgeservice.setUserData(user);
      _user.value=user;
      Get.toNamed('/home');
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }finally{
      isLoading.value=false;
    }
  }
  Future<void> googleSignIn()async{
    try{
      if (!await connectivityService.check()) {
    return;
  }
      isLoading.value=true;
     
  
      final user=await repository.signUpWithGoogle();
      localstorgeservice.setUserData(user);
      _user.value=user;
      Get.toNamed('/home');
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }finally{
      isLoading.value=false;
    }
  }
Future<void> updateuser({required String userId}) async {
  try {
    if (!await connectivityService.check()) {
    return;
  }
  if(!complationFormKey.currentState!.validate()){
    return;
  }
    isLoading.value = true;
  
    await repository.updateUserProfile(
      userId: userId,
      updatedData: {
        'name': nameController.text,
        'phone': phoneController.text,
        'dadphone': dadPhoneController.text,
      },
    );
    final updatedUser = await repository.getUser(userId);
    localstorgeservice.setUserData(updatedUser);
    _user.value = updatedUser;
    Get.offAllNamed('/home'); 
  } catch (e) {
    Get.snackbar('خطأ', e.toString());
  } finally {
    isLoading.value = false;
  }
}
  Future<void> sendPasswordResetEmail()async{
    try{
      if (!await connectivityService.check()) {
    return;
  }
  if(!forgetPasswordFormKey.currentState!.validate()){
    return;
  }
      isLoading.value=true;
         await repository.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar('تم إرسال رابط إعادة تعيين كلمة المرور', '');
      Get.toNamed('/login');
    }catch(e){
      Get.snackbar('خطأ', e.toString());
    }finally{
      isLoading.value=false;
    }
  }
  @override
void onClose() {
  nameController.dispose();
  emailController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  phoneController.dispose();
  dadPhoneController.dispose();
  super.onClose();
}
  
}
