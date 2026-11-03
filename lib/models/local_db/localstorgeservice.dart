import 'package:elearning/models/data_models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Localstorgeservice extends GetxService {
  final _boxName = 'userData';
  final _userKey = 'userKey';
  late Box _box;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init()async{
    await Hive.initFlutter();
    _box=await Hive.openBox(_boxName);
  }

  //  حفظ بيانات المستخدم
  Future<void> setUserData(UserModel user) async {
    await _box.put(_userKey, user.toJson());
  }

  //  جلب بيانات المستخدم
  UserModel? getUserData() {
    return UserModel.fromJson(_box.get(_userKey));
  }

  //  حذف بيانات المستخدم
  Future<void> clearUserData() async {
    await _box.delete(_userKey);
  }

  //  التحقق من وجود بيانات المستخدم
  bool get hasUserData => _box.containsKey(_userKey);
}
