import 'package:get/get.dart';

class SigninController extends GetxController{
  var isPasswordHidden=true.obs;
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


}