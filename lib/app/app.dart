import 'package:clothing_store/app/app_theme_data.dart';
import 'package:clothing_store/view/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:clothing_store/view/home_screen/home_screen.dart';
import 'package:clothing_store/view/location_screen/location_screen.dart';
import 'package:clothing_store/view/sign_in_screen/sign_in_screen.dart';
import 'package:clothing_store/view/signup_screen/signup_screen.dart';
import 'package:clothing_store/view/splash_screen/splash_screen.dart';
import 'package:clothing_store/view/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      initialRoute: "/bottom_nav_screen",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/welcome_screen", page: ()=>WelcomeScreen()),
        GetPage(name: "/sign_in_screen", page: ()=>SignInScreen()),
        GetPage(name: "/signup_screen", page: ()=>SignupScreen()),
        GetPage(name: "/location_screen", page: ()=>LocationScreen()),
        GetPage(name: "/home_screen", page: ()=>HomeScreen()),
        GetPage(name: "/bottom_nav_screen", page: ()=>BottomNavScreen()),
      ],
    );
  }
}
