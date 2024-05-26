import 'dart:convert';

import 'package:api_project/services/api_services.dart';
import 'package:api_project/view/recipes/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile_model.dart';

class AuthController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiServices apiServices = ApiServices();
  bool loading = false;
  ProfileModel? profileModel;
  void loginController() async {
    loading = true;
    update();
    String? response = await apiServices.login(userName.text, password.text);
    if (response != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("userResponse", response);
      getUserDate();
      Get.offAll(const HomeScreen());
    } else {
      Get.snackbar("Error", "Something went wrong");
      if (kDebugMode) {
        print("Response............. ${profileModel?.email}");
      }
    }
    loading = false;
    update();
  }

  Future<String?> getUserDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? getUser = preferences.getString("userResponse");
    if (getUser != null) {
      final data = jsonDecode(getUser);
      profileModel = ProfileModel.fromJson(data);
    }
    return getUser;
  }
}
