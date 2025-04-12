import 'dart:convert';
import 'package:clothing_store/app/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
    String url = AppUtils.signup_url;

    final Map<String, dynamic> requestBody = {
      'user_name': name,
      'user_email': email,
      'user_password': password,
    };

    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        Get.snackbar(
          "Success",
          responseData['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[100],
        );
        Get.offNamed("/sign_in_screen");
      } else {
        Get.snackbar(
          "Error",
          responseData['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
      );
    } finally {
      isLoading.value = false;
    }
  }
}
