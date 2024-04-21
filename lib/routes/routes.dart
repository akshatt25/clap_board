import 'package:clap_board/auth/screens/binding/auth_options_binding.dart';
import 'package:clap_board/auth/screens/signup_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final pages = [
    // GetPage(
    //   name: LoginOptionsPage.route,
    //   page: () => LoginOptionsPage(),
    //   binding: AuthOptionsBinding(),
    // ),
    GetPage(
      name: SignupPage.route,
      page: () => const SignupPage(),
      binding: AuthBinding(),
    ),
  ];
}
