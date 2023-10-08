import 'package:flutter/material.dart';
import 'package:todolist_apps/components/c_button.dart';
import 'package:todolist_apps/components/c_text_field.dart';
import 'package:todolist_apps/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              child: Image.asset(
                'assets/images/bg-register.png',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 48,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create \nAccount :)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.1),
                  CTextField(name: 'Email'),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  CTextField(name: 'Username'),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  CTextField(name: 'Password'),
                  SizedBox(height: mediaQuery.size.height * 0.1),
                  Center(
                    child: CButton(
                      name: 'REGISTER',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
