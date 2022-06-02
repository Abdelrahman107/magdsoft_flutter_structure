import 'package:flutter/cupertino.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  var isLogedin = false;

  @override
  void initState() {
    isLogedin = CacheHelper.sharedPreferences.getBool('isLogedin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
