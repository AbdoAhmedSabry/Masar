import 'package:elearning/controllers/profile/profile_controller.dart';
import 'package:get/get.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        authRepository: Get.find(),
        localstorage: Get.find(),
        connectivityService: Get.find(),
      ),
    );
  }
}
