import 'package:flutter/material.dart';
import 'package:todolist_apps/components/c_button.dart';
import 'package:todolist_apps/components/c_text_field.dart';
import 'package:todolist_apps/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
                  const CTextField(
                    name: 'Email',
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  const CTextField(
                    name: 'Username',
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  const CTextField(
                    name: 'Password',
                  ),
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
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have Account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
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
