import 'package:get/get.dart';

import '../../views/edit_profile_view.dart';
import '../../views/home_view.dart';
import '../../views/login_view.dart';
import '../../views/profile_view.dart';
import '../../views/register_view.dart';
import '../../views/splash_view.dart';
import '../bindings/edit_profile_binding.dart';
import '../bindings/profile_binding.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
