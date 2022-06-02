import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          if (CacheHelper.sharedPreferences.getBool('islogedin') == true) {
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
          }
        }

      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return null;
    }
  }
}
