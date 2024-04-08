// // ignore_for_file: avoid_print
// import 'package:flutter/material.dart';
// import 'package:mobile_assignment/code/constants.dart';
// import 'package:mobile_assignment/code/feild.dart';
// import 'package:mobile_assignment/code/newSignUpPage.dart';
// import 'package:mobile_assignment/code/newUserModel.dart';


// // ignore: must_be_immutable
// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   static String id = "LoginPage";
//   GlobalKey<FormState> formkey = GlobalKey();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   void showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           backgroundColor: kprimaryColourWhite,
//           body: Form(
//             key: formkey,
//             child: ListView(
//               children: [
//                 const SizedBox(height: 60),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'our app',
//                       style: TextStyle(
//                         fontSize: 30,
//                         // fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     Image.asset(
//                 //       'lib/assets/icons/treeCupAltered.png',
//                 //       width: 280,
//                 //       height: 280,
//                 //     )
//                 //   ],
//                 // ),
//                 const SizedBox(height: 20),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Login to your account',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                 Feild(
//                     text: 'Email',
//                     icon: const Icon(Icons.email),
//                     controller: emailController,
//                     fieldValidator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your Email';
//                       }
//                     }),
//                 const SizedBox(height: 15),
//                 Feild(
//                   text: 'Password',
//                   icon: const Icon(Icons.lock_outline),
//                   controller: passwordController,
//                   fieldValidator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     } else {
//                       if (value.length < 3 || value.length == 3) {
//                         return 'Your password must be four characters or more';
//                       }
//                     }
//                     return null; // Return null if the password is valid
//                   },
//                 ),
                
//                 const SizedBox(height: 25),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Builder(
//                       builder: (context) => ElevatedButton(
//                         onPressed: () {
//                           //sign-up logic
//                           bool passwordCorrect = checkIfPasswordRight(
//                               persons, passwordController.text);
//                           // bool userExists = checkIfUserExistsByID(
//                           //     persons, studentIdController.text);
//                               bool userExists = checkIfUserExists(
//                               persons, emailController.text);

//                           if (formkey.currentState!.validate()) {
//                             if (userExists) {
//                               if (passwordCorrect) {
//                                 print('sucssesfully logged in');
//                                 showSnackBar(context, 'sucssesfully logged in');
//                                 // Clear text fields
//                                 emailController.clear();
//                                 passwordController.clear();
//                                 //Navigator.pushNamed(context, homePage.id);
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (context) => HomePage()));
//                                 return;
//                               } else {
//                                 print('wrong password try again');

//                                 showSnackBar(context,
//                                     'Wrong password. Please try again.');
//                               }
//                               // Handle the case where the user not exists
//                             } else if (!userExists) {
//                               print('user is not existed before');
//                               showSnackBar(
//                                   context, 'user is not existed before');
//                             }
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: const Size(320, 48),
//                           backgroundColor: const Color(
//                               0xFF9A4253), // Hex color code for the button
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                                 100.0), // Adjust the border radius as needed
//                           ),
//                         ),
//                         child: const Text('Sign In'),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 25),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have an account?",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(width: 5),
//                     ////////////////////////////to return
//                     // GestureDetector(
//                     //     onTap: () {
//                     //       //var signUpPage;
//                     //       Navigator.pushNamed(context, SignUpPagee.id);
//                     //     },
//                     //     child: const Text("Sign Up")),
//                   ],
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }

//  // // Method to handle retrieving UserModel and using it
//   // void handleUserModel(BuildContext context) {
//   //   // Retrieve UserModel object passed from SignUpPage
//   //   final UserModel? user =
//   //       ModalRoute.of(context)?.settings.arguments as UserModel?;
//   // }
//   // String newEmail = emailController.text;

// // ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Processing Data')),
// //       );

// //kano fo2
//   // void showSnackBar(String message) {
//   //   scaffoldKey.currentState.showSnackBar(SnackBar(
//   //     content: Text(message),
//   //   ));

// // void showSnackBar(String message) {
// //     if (scaffoldKey.currentState != null) {
// //       scaffoldKey.currentState!.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(message),
// //       ));
// //     }
// //   }

// //         onSaved: (value) {
//                       //   emailController = value;
//                       // };


//                       // final a = 'wrong password try again';
//                               // final SnackBarr = SnackBar(content: Text(a));
//                               // ScaffoldMessenger.of(context).showSnackBar(SnackBarr);
//                               //showSnackBar('Wrong password. Please try again.');