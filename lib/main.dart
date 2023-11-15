import 'package:flutter/material.dart';
import 'package:login_screen_color_picker_example/views/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MainScreen(),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
