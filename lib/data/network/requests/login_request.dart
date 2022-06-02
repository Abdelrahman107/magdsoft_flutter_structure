import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class login_request {
  static const String REGISTER_API_URL =
      'https://magdsoft-internship.herokuapp.com/api/login';

  // send a post request to login api using dio helper
  Future<LoginResponse> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };
    var response = await DioHelper.postData(url: REGISTER_API_URL, body: body);
    print(response);

    // map data to register_response

    var loginResponse = LoginResponse.fromJson(response.data);
    if (loginResponse.status == 200) {
      // save to shared prefences with key islogedin
      await CacheHelper.sharedPreferences.setBool('islogedin', true);
    } else {
      await CacheHelper.sharedPreferences.setBool('islogedin', false);
    }
    return loginResponse;
  }
}
