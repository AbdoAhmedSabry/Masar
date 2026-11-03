import 'package:elearning/controllers/auth/auth_controller.dart';
import 'package:elearning/models/data_models/remote_db/authrepository.dart';
import 'package:get/get.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
    Get.put<AuthController>(
      AuthController(repository: Get.find(), localstorgeservice: Get.find(), connectivityService: Get.find()),
      permanent: true,
    );
  }
}
