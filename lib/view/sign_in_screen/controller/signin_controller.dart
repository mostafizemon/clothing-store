import 'dart:ui';

import 'package:clothing_store/services/network_caller.dart';
import 'package:clothing_store/services/user_prefs.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../app/app_utils.dart';

class SigninController extends GetxController {
  var isPasswordHidden = true.obs;
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    String url = AppUtils.login_url;

    final Map<String, dynamic> requestBody = {
      'user_email': email,
      'user_password': password,
    };

    NetworkResponse response = await NetworkCaller().postRequest(
      url,
      body: requestBody,
    );

    if (response.isSuccess) {
      final String status = response.responseData['status'];
      final String message = response.responseData['message'];
      if (status == "success") {
        final Map<String, dynamic> data = response.responseData['data'];
        final String userId = data['user_id'].toString();
        final String userName = data['user_name'].toString();
        final String userEmail = data['user_email'].toString();
        final String? userAddress = data['user_address'].toString();
        final String? userPhone = data['user_phone'].toString();
        final String? userImage = data['user_image'].toString();
        final userData = response.responseData['data'];
        Get.snackbar(
          "Success",
          message,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        UserPrefs.saveInitialUser(id: userId, name: userName, email: userEmail);
        UserPrefs.updateUserAddress(userAddress);
        UserPrefs.updateUserPhone(userPhone);
        UserPrefs.updateUserImage(userImage);
        Get.offNamed("/home_screen");
      } else {
        Get.snackbar(
          "Failed",
          message,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        "Network Error",
        response.errorMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
