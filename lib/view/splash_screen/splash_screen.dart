import 'dart:async';
import 'package:clothing_store/app/app_utils.dart';
import 'package:clothing_store/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 3));

    Map<String, String> userData = await UserPrefs.getUserData();

    if (userData['user_email'] != null && userData['user_email']!.isNotEmpty) {
      Get.offNamed("/home_screen");
    } else {
      Get.offNamed("/welcome_screen");
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppUtils.logo, height: 500)),
    );
  }
}
