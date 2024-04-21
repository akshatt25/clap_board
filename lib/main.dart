import 'package:clap_board/auth/screens/login_page.dart';
import 'package:clap_board/auth/screens/signup_page.dart';
import 'package:clap_board/routes/routes.dart';
import 'package:clap_board/utils/global.dart';
import 'package:clap_board/utils/theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: globalNavKey,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      getPages: AppRoutes.pages,
      initialRoute: SignupPage.route,
    );
  }
}
