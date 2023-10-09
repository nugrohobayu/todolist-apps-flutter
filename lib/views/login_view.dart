import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todolist_apps/components/c_button.dart';
import 'package:todolist_apps/components/c_text_field.dart';
import 'package:todolist_apps/views/register_view.dart';
import 'package:todolist_apps/views/todo_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  bool isValidate = false;
  bool showPassword = true;

  Future<bool?> validateCtrl(String username, String password) async {
    if (username.isEmpty) {
      isValidate = true;
    } else if (password.isEmpty) {
      isValidate = true;
    } else {
      isValidate = false;
    }
    return isValidate;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: mediaQuery.size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuery.size.height * 0.12,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    "Enter Your Username & Password",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height * 0.8,
                    child: Image.asset(
                      'assets/images/bg-login.png',
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mediaQuery.size.height * 0.15,
                      ),
                      CTextField(
                        name: "Username",
                        ctrl: ctrlUsername,
                        validator:
                            isValidate ? 'Username Can\'t Be Empty' : null,
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.06,
                      ),
                      CTextField(
                        name: "Password",
                        ctrl: ctrlPassword,
                        obscureText: showPassword,
                        validator:
                            isValidate ? 'Password Can\'t Be Empty' : null,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.15,
                      ),
                      Center(
                          child: CButton(
                        name: 'Login',
                        onPressed: () {
                          setState(() {
                            validateCtrl(ctrlUsername.text, ctrlPassword.text)
                                .then((value) {
                              if (value == false) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TodoView(name: ctrlUsername.text),
                                    ));
                              }
                            });
                          });
                        },
                      )),
                      Center(
                        child: Container(
                          height: mediaQuery.size.height * 0.2,
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: RichText(
                              text: TextSpan(
                                  text: "Don't Have Account? ",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                  ),
                                  children: [
                                TextSpan(
                                    text: "Create Account",
                                    style: const TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterView(),
                                          )))
                              ])),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
