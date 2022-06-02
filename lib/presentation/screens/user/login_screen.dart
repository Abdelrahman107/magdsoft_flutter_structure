import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/login/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/login/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/theme.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.blue,
        body: ListView(physics: NeverScrollableScrollPhysics(), children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                // row with sized box and button
                Row(
                  children: [
                    SizedBox(),
                    // button
                    CustomButtton(
                      text: 'عربى',
                      onPressed: () {},
                      color: ThemeColor.white,
                    ),
                  ],
                ),

                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                // make a white container with rounded corners
              ])),
          Container(
              height: MediaQuery.of(context).size.height / 0.7,
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
              decoration: BoxDecoration(
                color: ThemeColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(children: [
                    // make email  and password with validation in english

                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: ThemeColor.darkGrey,
                        ),
                        fillColor: ThemeColor.lightGrey,
                        filled: true,
                        labelStyle: TextStyle(color: ThemeColor.darkGrey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.darkGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.lightGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: ThemeColor.darkGrey,
                        ),
                        fillColor: ThemeColor.lightGrey,
                        filled: true,
                        labelStyle: TextStyle(color: ThemeColor.darkGrey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.darkGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.lightGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    // row with two button
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocListener<LoginCubit, LoginState>(
                          bloc: BlocProvider.of<LoginCubit>(context),
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            }

                            if (state is LoginFailure) {
                              Fluttertoast.showToast(
                                  msg: state.message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                    _emailController.text,
                                    _passwordController.text);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              child: Text("Login",
                                  style:
                                      const TextStyle(color: ThemeColor.white)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeColor.blue,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              // push and remove until

                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/register', (route) => false);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              child: Text("Register",
                                  style:
                                      const TextStyle(color: ThemeColor.white)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeColor.blue,
                              ),
                            )),
                      ],
                    ),
                  ]),

                  // row with two button login and register
                ),
              )),
        ]));
  }

  Widget CustomTextFormField(
      {String? hint,
      String? label,
      TextInputType? type,
      TextStyle? style,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return TextFormField(
      validator: validator,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: ThemeColor.darkGrey,
        ),
        labelText: label,
        fillColor: ThemeColor.lightGrey,
        filled: true,
        labelStyle: TextStyle(color: ThemeColor.darkGrey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.darkGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.lightGrey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: type,
    );
  }
}
