import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/register/register_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/user_cubit/register/register_state.dart';
import 'package:magdsoft_flutter_structure/constants/theme.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _fullNameController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.blue,
        body: ListView(physics: NeverScrollableScrollPhysics(), children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.25,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                // row with sized box and button
                Row(
                  children: [
                    SizedBox(),
                    // button
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
              height: MediaQuery.of(context).size.height / 0.8,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                    // full name
                    TextFormField(
                      controller: _fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
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
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    ), // phone number
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
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
                      keyboardType: TextInputType.phone,
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

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocListener<RegisterCubit, RegisterState>(
                          bloc: BlocProvider.of<RegisterCubit>(context),
                          listener: (context, state) {
                            if (state is RegisterSuccess) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            }

                            if (state is RegisterFailure) {
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
                                context.read<RegisterCubit>().register(
                                      _fullNameController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      _phoneNumberController.text,
                                    );
                              }
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
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              // push and remove until

                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
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
                            )),
                      ],
                    ),
                  ]),

                  // row with two button login and register
                ),
              )),
        ]));
  }
}
