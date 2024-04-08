import 'package:flutter/material.dart';
import 'package:mobile_assignment/5alasMalo4Lazma/LoginPage.dart';
import 'package:mobile_assignment/5alasMalo4Lazma/newSignUpPage%20copy.dart';
import 'package:mobile_assignment/5alasMalo4Lazma/newSignUpPage.dart';
import 'package:mobile_assignment/code/newUserModel.dart';
import 'package:mobile_assignment/code/LoginPage.dart';
import 'package:mobile_assignment/code/newSignUpPage.dart';


void main() async {
  
  // addUser('salma', 'female', 'salma', '4', '20200230', '111','111');
  
  runApp(const mobileApp());
}


class mobileApp extends StatelessWidget {
  const mobileApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
       LoginPage.id: (context) => LoginPage(),
       // SignUpPage.id: (context) => const SignUpPage(),
       // HomePage.id:(context) =>const HomePage(),
        SignUpPagee.id:(context) => const SignUpPagee(),
      },
      initialRoute: SignUpPagee.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
