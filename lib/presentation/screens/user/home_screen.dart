import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/theme.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

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
        centerTitle: true,
        backgroundColor: ThemeColor.blue,
        title: Text('User Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 30,
                color: ThemeColor.blue,
              ),
            ),
            Text('Email: $email',
                style: TextStyle(
                  fontSize: 30,
                  color: ThemeColor.blue,
                )),
            Text('Phone: $phone',
                style: TextStyle(
                  fontSize: 30,
                  color: ThemeColor.blue,
                )),

            // make a button to logout
            SizedBox(
              height: 500,
            ),
            InkWell(
                onTap: () {
                  // push and remove until
                  // set islogedin to false
                  CacheHelper.sharedPreferences.setBool('islogedin', false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.06,
                  alignment: Alignment.center,
                  child: Text("Logout",
                      style: const TextStyle(color: ThemeColor.white)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColor.rded),
                )),
          ],
        ),
      ),
    );
  }
}
