import 'package:elearning/models/data_models/remote_db/authrepository.dart';
import 'package:elearning/models/data_models/user_model.dart';
import 'package:elearning/models/local_db/localstorgeservice.dart';
import 'package:elearning/models/local_db/network_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  final Localstorgeservice localstorage;
  final ConnectivityService connectivityService;

  ProfileController({
    required this.authRepository,
    required this.localstorage,
    required this.connectivityService,
  });

UserModel? get currentUserModel => localstorage.getUserData();
  // تصحيح اسم المسار لشاشة التعديل
  void goToEditProfile() => Get.toNamed(Routes.editProfile);

  Future<void> logOut() async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: const Text("Logout"),
            onPressed: () async {
              Get.back(); // إغلاق الـ Dialog أولاً

              try {
                if (!await connectivityService.check()) {
                  Get.snackbar('خطأ', 'لا يوجد اتصال بالإنترنت');
                  return;
                }

                await localstorage.clearUserData();
                await authRepository.logout();

                Get.offAllNamed(Routes.login);
              } catch (e) {
                Get.snackbar('خطأ', e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
