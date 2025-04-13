import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static Future<void> saveInitialUser({
    required String id,
    required String name,
    required String email,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', id);
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
    await prefs.setString('user_phone', '');
    await prefs.setString('user_address', '');
    await prefs.setString('user_image', '');
  }

  static Future<void> updateUserAddress(String? address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_address', address ?? '');
  }

  static Future<void> updateUserPhone(String? phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_phone', phone ?? '');
  }

  static Future<void> updateUserImage(String? imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_image', imageUrl ?? '');
  }

  static Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'user_id': prefs.getString('user_id') ?? '',
      'user_name': prefs.getString('user_name') ?? '',
      'user_email': prefs.getString('user_email') ?? '',
      'user_phone': prefs.getString('user_phone') ?? '',
      'user_address': prefs.getString('user_address') ?? '',
      'user_image': prefs.getString('user_image') ?? '',
    };
  }

  static Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
