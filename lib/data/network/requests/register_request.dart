import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRequest {
  static const String REGISTER_API_URL =
      'https://magdsoft-internship.herokuapp.com/api/register';
  // curl --location --request POST 'https://magdsoft-internship.herokuapp.com/api/register' \
// --form 'name="ahmed"' \
// --form 'email="ahmd@gmail.com"' \
// --form 'password="123456"' \
// --form 'phone="01123226530"'

  // send a post request to register api using dio helper
  Future<bool> register(
      String name, String email, String password, String phone) async {
    var body = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
    var response = await DioHelper.postData(url: REGISTER_API_URL, body: body);
    print(response);

    // map data to register_response

    var registerResponse = RegisterResponse.fromJson(response.data);
    if (registerResponse.status == 200) {
      // save to shared prefences with key islogedin

      await CacheHelper.sharedPreferences.setBool('islogedin', true);
      await CacheHelper.sharedPreferences.setString('name', name);
      await CacheHelper.sharedPreferences.setString('email', email);
      await CacheHelper.sharedPreferences.setString('phone', phone);
      print(response.data);

      return true;
    } else {
      return false;
    }
  }
}
