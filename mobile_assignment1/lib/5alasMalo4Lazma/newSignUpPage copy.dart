// // ignore_for_file: annotate_overrides
// import 'package:flutter/material.dart';
// import 'package:mobile_assignment/code/constants.dart';
// import 'package:mobile_assignment/code/feild.dart';
// import 'package:mobile_assignment/code/genderFeild.dart';
// import 'package:mobile_assignment/code/levelCheck.dart';
// import 'package:mobile_assignment/code/LoginPage.dart';
// import 'package:mobile_assignment/code/newUserModel.dart';
// import 'package:mobile_assignment/modelDB/DatabaseHelper.dart';

// class SignUpPagee extends StatefulWidget {
//   const SignUpPagee({super.key});
//   static String id = "SignUpPagee";

//   @override
//   State<SignUpPagee> createState() => _SignUpPageeState();
// }

// class _SignUpPageeState extends State<SignUpPagee> {
  
//     late DatabaseHelper databaseHelper;

//  @override
//   void initState() {
//     super.initState();
//     databaseHelper = DatabaseHelper();
//   }



//   @override
//   String selectedGender = '';
//   final formKey = GlobalKey<FormState>(); //key for form

//   GlobalKey<FormState> formkey = GlobalKey();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   void showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   bool validateEmail(String email) {
//     // Regular expression for the email pattern
//     final RegExp emailRegex =
//         RegExp(r"^[a-zA-Z0-9_.+-]+@stud\.fci-cu\.edu\.eg$");

//     // Check if the email matches the pattern
//     return emailRegex.hasMatch(email);
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: kprimaryColourWhite,
//         body: Form(
//             key: formkey,
//             child: ListView(
//               children: [
//                 const SizedBox(height: 90),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'sign up',
//                       style: TextStyle(
//                         fontSize: 27,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),

//                 Feild(
//                     text: 'Name',
//                     icon: const Icon(Icons.person_2_outlined),
//                     controller: nameController,
//                     fieldValidator: (value) {
//                       if (value == null || value.isEmpty) {
//                         print("empty name");
//                         return 'Please enter your name';
//                       }
//                     }),

//                 const SizedBox(height: 15),
//                 Feild(
//                     text: 'Email',
//                     icon: const Icon(Icons.email_outlined),
//                     controller: emailController,
//                     fieldValidator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                         // } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$)').hasMatch(value!)) {
//                         //   return"correct";

//                         //   // EmailValidator(
//                         //   //     errorText: 'Please correct email filled');
//                         // }
//                       } else {
//                         if (validateEmail(value)) {
//                           return "email should be like 'studentID@stud.fci-cu.edu.eg'";
//                         }
//                       }
//                     }),
//                 const SizedBox(height: 15),
//                 Feild(
//                     text: 'student ID',
//                     icon: const Icon(Icons.numbers),
//                     controller: studentIdController,
//                     fieldValidator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your student ID';
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
//                 // value!.length < 8 ? "nn" : null,

//                 const SizedBox(height: 15),
//                 Feild(
//                     text: 'Confirm Password',
//                     icon: const Icon(Icons.password_outlined),
//                     controller: confirmPasswordController,
//                     fieldValidator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter same password again';
//                       } else {
//                         if (value.length < 3 || value.length == 3) {
//                           return 'Your password must be four characters or more';
//                         }
//                       }
//                       return null;
//                     }),
//                 const SizedBox(height: 15),
//                 const levelCheck(),
//                 genderFeild(),

//                 const SizedBox(height: 25),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Builder(builder: (context) {
// //                       return ElevatedButton(
// //                         onPressed: () {
// //                           // String newEmail = emailController.text;

// //                           bool userExists =
// //                               checkIfUserExists(persons, emailController.text);

// //                           //formkey.currentState != null &&
// //                           if (formkey.currentState?.validate() ?? false) {
// //                             // Validate passwords match
// //                             if (passwordController.text ==
// //                                 confirmPasswordController.text) {
// //                               // Check if the user already exists
// //                               if (userExists) {
// //                                 // Handle the case where the user already exists
// //                                 print(
// //                                     'User with email ${emailController.text} already exists');
// //                                 showSnackBar(context,
// //                                     'User with email ${emailController.text} already exists');
// //                                 return;
// //                               } else if (!userExists) {
// //                                 addUser(
// //                                     nameController.text,
// //                                     genderController.text,
// //                                     emailController.text,
// //                                     levelController.text,
// //                                     studentIdController.text,
// //                                     passwordController.text,
// //                                     confirmPasswordController.text);
// //                                 for (UserModel user in persons) {
// //                                   print(
// //                                       'User: ${user.name} ${user.gender} (${user.email}) (${user.level}) (${user.studentId}) (${user.password})');
// //                                 }
// //                                 // Clear text fields
// //                                 nameController.clear();
// //                                 genderController.clear();
// //                                 emailController.clear();
// //                                 levelController.clear();
// //                                 studentIdController.clear();
// //                                 passwordController.clear();
// //                                 confirmPasswordController.clear();
// //                               }
// //                               // Navigator.push(
// //                               //     context,
// //                               //     MaterialPageRoute(
// //                               //         builder: (context) => LoginPage()));
// //                               print('User registered successfully');
// //                               showSnackBar(context, 'signup success');
// //                              // Navigator.pushNamed(context, LoginPage.id);
// //                             } else {
// //                               // show error message
// //                               print('Passwords do not match');
// //                               showSnackBar(context, 'Passwords do not match');
// //                             }
// //                           }





// // // Create a UserModel object with the entered data
// //           UserModel newUser = UserModel(
// //             name: nameController.text,
// //             email: emailController.text,
// //             studentId: studentIdController.text,
// //             password: passwordController.text,
// //             confirmPassword: confirmPasswordController.text,
// //             gender: genderController.text,
// //             level: levelController.text,
// //           );

// //           // Call the method to add the user to the database
// //          // addUserToDatabase(newUser);
// // // Inside the sign-up button onPressed callback
// // DatabaseHelper().insertUser(User(name: nameController.text, email: emailController.text));

// //           // Clear text fields
// //           nameController.clear();
// //           emailController.clear();
// //           studentIdController.clear();
// //           passwordController.clear();
// //           confirmPasswordController.clear();






// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           fixedSize: const Size(320, 48),
// //                           backgroundColor: kprimaryColourGreen,
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(100.0),
// //                           ),
// //                         ),
// //                         child: const Text('Sign Up'),
// //                       );
// //                     }),
// //                   ],
// //                 ),










// Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Builder(builder: (context) {
//                       return ElevatedButton(
//                         onPressed: () {
//                           // String newEmail = emailController.text;

//                           // bool userExists =
//                           //     checkIfUserExists(persons, emailController.text);

//                           // //formkey.currentState != null &&
//                           // if (formkey.currentState?.validate() ?? false) {
//                           //   // Validate passwords match
//                           //   if (passwordController.text ==
//                           //       confirmPasswordController.text) {
//                           //     // Check if the user already exists
//                           //     if (userExists) {
//                           //       // Handle the case where the user already exists
//                           //       print(
//                           //           'User with email ${emailController.text} already exists');
//                           //       showSnackBar(context,
//                           //           'User with email ${emailController.text} already exists');
//                           //       return;
//                           //     } else if (!userExists) {
//                           //       addUser(
//                           //           nameController.text,
//                           //           genderController.text,
//                           //           emailController.text,
//                           //           levelController.text,
//                           //           studentIdController.text,
//                           //           passwordController.text,
//                           //           confirmPasswordController.text);
//                           //       for (UserModel user in persons) {
//                           //         print(
//                           //             'User: ${user.name} ${user.gender} (${user.email}) (${user.level}) (${user.studentId}) (${user.password})');
//                           //       }
//                           //       // Clear text fields
//                           //       nameController.clear();
//                           //       genderController.clear();
//                           //       emailController.clear();
//                           //       levelController.clear();
//                           //       studentIdController.clear();
//                           //       passwordController.clear();
//                           //       confirmPasswordController.clear();
//                           //     }
//                           //     // Navigator.push(
//                           //     //     context,
//                           //     //     MaterialPageRoute(
//                           //     //         builder: (context) => LoginPage()));
//                           //     print('User registered successfully');
//                           //     showSnackBar(context, 'signup success');
//                           //    // Navigator.pushNamed(context, LoginPage.id);
//                           //   } else {
//                           //     // show error message
//                           //     print('Passwords do not match');
//                           //     showSnackBar(context, 'Passwords do not match');
//                           //   }
//                           // }





// // Create a UserModel object with the entered data
//           UserModel newUser = UserModel(
//             name: nameController.text,
//             email: emailController.text,
//             studentId: studentIdController.text,
//             password: passwordController.text,
//             confirmPassword: confirmPasswordController.text,
//             gender: genderController.text,
//             level: levelController.text,
//           );

//           // Call the method to add the user to the database
//          // addUserToDatabase(newUser);
// // Inside the sign-up button onPressed callback
// DatabaseHelper().insertUser(User(name: nameController.text, email: emailController.text));
//  for (UserModel user in persons) {
//                                   print(
//                                       'User: ${user.name} ${user.gender} (${user.email}) (${user.level}) (${user.studentId}) (${user.password})');
//                                 }
//                                 print('Saving user data: ${nameController.text}, ${emailController.text},');
//           // Clear text fields
//           nameController.clear();
//           emailController.clear();
//           studentIdController.clear();
//           passwordController.clear();
//           confirmPasswordController.clear();






//                         },
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: const Size(320, 48),
//                           backgroundColor: kprimaryColourGreen,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100.0),
//                           ),
//                         ),
//                         child: const Text('Sign Up'),
//                       );
//                     }),
//                   ],
//                 ),









//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account?",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(width: 5),
//                     //to return
//                     // GestureDetector(
//                     //   onTap: () {
//                     //     Navigator.pushNamed(context, LoginPage.id);
//                     //   },
//                     //   child: const Text("Sign In"),
//                     // ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
//   // void addUserToDatabase(UserModel user) async {
//   //   int result = await databaseHelper.saveUser(user);
//   //   if (result != 0) {
//   //     // Success
//   //     print("User added to database successfully");
//   //   } else {
//   //     // Failure
//   //     print("Failed to add user to database");
//   //   }
//   // }
// }

