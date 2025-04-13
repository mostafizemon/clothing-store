import 'package:clothing_store/app/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/network_caller.dart';

class SignupController extends GetxController {
  var isPasswordHidden = true.obs;
  var isChecked = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    final Map<String, dynamic> requestBody = {
      'user_name': name,
      'user_email': email,
      'user_password': password,
    };

    NetworkResponse response = await NetworkCaller().postRequest(
      AppUtils.signup_url,
      body: requestBody,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      final String status = response.responseData['status'];
      final String message = response.responseData['message'];

      if (status == 'success') {
        Get.snackbar(
          "Success",
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[100],
        );
        Get.offNamed("/sign_in_screen");
      } else {
        Get.snackbar(
          "Error",
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
      }
    } else {
      Get.snackbar(
        "Network Error",
        response.errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
      );
    }
  }
}
