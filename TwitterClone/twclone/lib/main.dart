import 'package:flutter/material.dart';
import 'package:twclone/pages/auth/signUp.dart';
import 'package:twclone/pages/welcome_screen.dart';
import 'package:twclone/utils/customColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/signUp": (context) => SignUp(),
        "/welcomePage":(context) => WelcomeScreen(),
      },
      theme: ThemeData(
        backgroundColor: CustomColors.twitterWhite
      ),
      home: WelcomeScreen()

    );
  }
}
