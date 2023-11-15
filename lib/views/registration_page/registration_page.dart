import 'package:flutter/material.dart';
import 'package:login_screen_color_picker_example/views/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            Text(
              "Register",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                if (unController.text.trim().isNotEmpty &&
                    passController.text.trim().isNotEmpty) {
                  await preferences.setString(
                      'username', unController.text.trim());
                  await preferences.setString(
                      'password', passController.text.trim());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
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
              child: Text("Register"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
