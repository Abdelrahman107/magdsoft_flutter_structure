import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/theme.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';

class HomeScreen extends StatefulWidget {
  // name,email,phone

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name;
  late String email;
  late String phone;
  bool isLogedin = false;

  @override
  void initState() {
    // get data from shared preferences

    name = CacheHelper.sharedPreferences.getString('name')!;
    email = CacheHelper.sharedPreferences.getString('email')!;
    phone = CacheHelper.sharedPreferences.getString('phone')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return scaffold with name and email and phone

    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.blue,
        title: Text('User Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
            ),
            Text('Email: $email'),
            Text('Phone: $phone'),
          ],
        ),
      ),
    );
  }
}
