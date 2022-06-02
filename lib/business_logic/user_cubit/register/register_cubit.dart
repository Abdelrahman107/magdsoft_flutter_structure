import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/register/register_state.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(
      String name, String email, String password, String phone) async {
    emit(RegisterLoading());
    try {
      var response =
          await RegisterRequest().register(name, email, password, phone);

      if (response.status == 200) {
        print("in status 200");
        emit(RegisterSuccess(message: 'Register Success'));
      } else {
        emit(RegisterFailure(message: response.message));
      }
    } catch (e) {
      emit(RegisterFailure(message: 'Login Failed'));
    }
  }
}
