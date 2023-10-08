import 'package:flutter/material.dart';
import 'package:todolist_apps/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Color(0xffcdfad5),
          fontFamily: 'Gabarito',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xffFF8080),
            secondary: const Color(0xffF6FDC3),
            onSecondary: const Color(0xffcdfad5),
            tertiary: const Color(0xffFFCF96),
          )),
      home: const LoginView(),
    );
  }
}
