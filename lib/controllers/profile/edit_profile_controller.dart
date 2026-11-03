import 'package:elearning/models/data_models/remote_db/authrepository.dart';
import 'package:elearning/models/local_db/localstorgeservice.dart';
import 'package:elearning/models/local_db/network_check.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final AuthRepository authRepository;
  final Localstorgeservice localstorage;
  final ConnectivityService connectivityService;

  EditProfileController({
    required this.authRepository,
    required this.localstorage,
    required this.connectivityService,
  });

  final isloading = false.obs;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dadPhoneController = TextEditingController();
  final levelController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // جلب بيانات المستخدم المخزنة محلياً لأنها تحتوي على الحقول المخصصة (مثل dadphone)
    final currentUserModel = localstorage.getUserData();
    if (currentUserModel != null) {
      nameController.text = currentUserModel.name;
      phoneController.text = currentUserModel.phone;
      dadPhoneController.text = currentUserModel.dadphone; //
      levelController.text = currentUserModel.level;
    }
  }

  Future<void> updateProfile() async {
    try {
      if (!await connectivityService.check()) {
        return;
      }
      isloading.value = true;

      final userId = authRepository.currentUser!.uid;

      await authRepository.updateUserProfile(
        userId: userId,
        updatedData: {
          'name': nameController.text,
          'phone': phoneController.text,
          'dadphone': dadPhoneController.text,
          'level': levelController.text,
        },
      );

      // جلب البيانات المحدثة وتخزينها محلياً
      final updatedUser = await authRepository.getUser(userId);
      localstorage.setUserData(updatedUser);

      Get.back();
      Get.snackbar('تم تحديث الملف الشخصي بنجاح', '');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isloading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    dadPhoneController.dispose();
    levelController.dispose();
    super.onClose();
  }
}
