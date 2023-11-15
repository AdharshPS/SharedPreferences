import 'package:flutter/material.dart';
import 'package:login_screen_color_picker_example/views/home_screen/home_screen.dart';
import 'package:login_screen_color_picker_example/views/registration_page/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController unController = TextEditingController();
  TextEditingController passController = TextEditingController();

  SizedBox height10 = SizedBox(
    height: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login"),
            height10,
            TextFormField(
              controller: unController,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            height10,
            TextFormField(
              controller: passController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            height10,
            ElevatedButton(
              onPressed: () async {
                final SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                String userName = await preferences.get("username").toString();
                String password = await preferences.get("password").toString();
                if (unController.text.trim() == userName &&
                    passController.text.trim() == password) {
                  await preferences.setBool("isLogged", true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("enter valid username and password"),
                    ),
                  );
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("dont have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
