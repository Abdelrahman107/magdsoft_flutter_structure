import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/login/login_state.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/register/register_state.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      var response = await login_request().login(email, password);

      if (response.status == 200) {
        print("in status 200");
        emit(LoginSuccess(message: 'Register Success'));
      } else {
        emit(LoginFailure(message: "User Not Found"));
      }
    } catch (e) {
      emit(LoginFailure(message: 'Login Failed'));
    }
  }
}
