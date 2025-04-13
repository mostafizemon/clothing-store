import 'package:clothing_store/app/app_colors.dart';

import 'package:clothing_store/app/app_utils.dart';

import 'package:clothing_store/view/widgets/elevatedbutton_text.dart';
import 'package:clothing_store/view/widgets/input_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(LocationController());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xFFEDEDED),
                  child: Image.asset(AppUtils.location_icon),
                ),
                SizedBox(height: 32),
                InputHeader(
                  header: "What is Your Location?",
                  subheader:
                      "We need to know your location in order to suggest nearby services",
                ),
                SizedBox(height: 16),
                locationController.isLoading.value
                    ? CircularProgressIndicator()
                    : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          locationController.getUserFullAddress();
                        },
                        child: ElevatedbuttonText(
                          text: "Allow Location Access",
                        ),
                      ),
                    ),
                SizedBox(height: 16),
                if (locationController.address.isNotEmpty)
                  Text(
                    locationController.address.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Enter Location Manually",
                    style: TextStyle(
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
