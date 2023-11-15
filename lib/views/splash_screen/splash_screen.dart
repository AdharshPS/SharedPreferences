import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_screen_color_picker_example/views/home_screen/home_screen.dart';
import 'package:login_screen_color_picker_example/views/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      bool? isLogged = preferences.getBool("isLogged");

      if (isLogged == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shared Preferences"),
      ),
    );
  }
}
