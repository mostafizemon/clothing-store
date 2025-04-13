import 'package:clothing_store/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../app/app_utils.dart';
import '../../../services/network_caller.dart';

class LocationController extends GetxController {
  var address = ''.obs;
  RxBool isLoading = false.obs;
  RxBool findLocation = false.obs;


  Future<void> getUserFullAddress() async {
    isLoading.value = true;
    try {

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }


      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          "Permission Denied",
          "Please enable location permission in app settings.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        await Geolocator.openAppSettings();
        isLoading.value = false;
        return;
      }

      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location permission is required.");
        isLoading.value = false;
        return;
      }


      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          "Location Off",
          "Please turn on location services.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        await Geolocator.openLocationSettings();
        isLoading.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        findLocation.value = true;
        final place = placemarks.first;
        address.value = '''
${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}
''';

        try{
          Map<String, String> userData = await UserPrefs.getUserData();
          String userId = userData['user_id'] ?? '';
          final Map<String, dynamic> requestBody = {'user_id': userId, 'user_address': address.value};
          NetworkResponse response = await NetworkCaller().postRequest(
            AppUtils.location_url,
            body: requestBody,
          );

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
              UserPrefs.updateUserAddress(address.value);
              Get.offNamed("/home_screen");
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

        }catch(e){

        }

        UserPrefs.updateUserAddress(address.value);
      } else {
        address.value = "Address not found.";
        findLocation.value = false;
      }
    } catch (e) {
      address.value = "Error: $e";
      findLocation.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> updateAddress({
  //   required String address,
  // }) async {}
}
