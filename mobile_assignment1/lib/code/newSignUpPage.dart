import 'package:flutter/material.dart';
import 'package:mobile_assignment/code/constants.dart';
import 'package:mobile_assignment/code/feild.dart';
import 'package:mobile_assignment/code/genderFeild.dart';
import 'package:mobile_assignment/code/levelCheck.dart';
import 'package:mobile_assignment/5alasMalo4Lazma/LoginPage.dart';
import 'package:mobile_assignment/code/DatabaseHelper.dart';
import 'package:mobile_assignment/code/LoginPage.dart';

class SignUpPagee extends StatefulWidget {
  const SignUpPagee({Key? key}) : super(key: key);
  static String id = "SignUpPagee";

  @override
  State<SignUpPagee> createState() => _SignUpPageeState();
}

class _SignUpPageeState extends State<SignUpPagee> {
  final formKey = GlobalKey<FormState>(); //key for form
  final DatabaseHelper dbHelper =
      DatabaseHelper(); // Initialize the database helper

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool validateEmail(String email) {
    // Regular expression for the email pattern
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9_.+-]+@stud\.fci-cu\.edu\.eg$");

    // Check if the email matches the pattern
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColourWhite,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 90),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'sign up',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Feild(
              text: 'Name',
              icon: const Icon(Icons.person_2_outlined),
              controller: nameController,
              fieldValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
              },
            ),
            const SizedBox(height: 15),
            Feild(
              text: 'Email',
              icon: const Icon(Icons.email_outlined),
              controller: emailController,
              fieldValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else {
                  if (!validateEmail(value)) {
                    return "email should be like 'studentID@stud.fci-cu.edu.eg'";
                  }
                }
              },
            ),
            const SizedBox(height: 15),
            Feild(
              text: 'student ID',
              icon: const Icon(Icons.numbers),
              controller: studentIdController,
              fieldValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your student ID';
                }
              },
            ),
            const SizedBox(height: 15),
            Feild(
              text: 'Password',
              icon: const Icon(Icons.lock_outline),
              controller: passwordController,
              fieldValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else {
                  if (value.length < 8) {
                    return 'Your password must be eight characters or more';
                  }
                }
              },
            ),
            const SizedBox(height: 15),
            Feild(
              text: 'Confirm Password',
              icon: const Icon(Icons.password_outlined),
              controller: confirmPasswordController,
              fieldValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter same password again';
                } else {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                }
              },
            ),
            const SizedBox(height: 15),
            const levelCheck(),
            genderFeild(),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        // Validating passwords match
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          // Insert user data into database
                          await dbHelper.insertUser({
                            'name': nameController.text,
                            'email': emailController.text,
                            'studentId': studentIdController.text,
                            'password': passwordController.text,
                          });
                          // Registration successful
                          showSnackBar(context, 'Signup success');
                          // Navigate to login page
                          Navigator.pushNamed(context, LoginPage.id);
                        } else {
                          showSnackBar(context, 'Passwords do not match');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(320, 48),
                      backgroundColor: kprimaryColourGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: const Text('Sign Up'),
                  );
                }),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: const Text("Sign In"),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
),
);
}
}
