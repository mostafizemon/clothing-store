import 'dart:ui';

import 'package:clothing_store/services/network_caller.dart';
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
        final userData = response.responseData['data'];
        Get.snackbar(
          "Success",
          message,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
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
