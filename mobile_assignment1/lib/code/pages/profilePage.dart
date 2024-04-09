import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_assignment/code/pages/UpdateProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';
import 'package:mobile_assignment/code/pages/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String id = "ProfilePage";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<String, dynamic> userData = {};
  late int userId;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    getUserIdFromLocalStorage();
  }

Future<void> getUserIdFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ??
        0; // 0 is the default value if userId is not found
    getUserData();
  }

 Future<void> getUserData() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    Map<String, dynamic>? user = await dbHelper.getUserById(userId);
    if (user != null) {
      setState(() {
        userData = user;
        // Load image if available
        String? imagePath = userData['imagePath'];
        if (imagePath != null && imagePath.isNotEmpty) {
          print('Image Path from Database: $imagePath');
          _image = XFile(imagePath);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                centerTitle: true,

        title: Text('Profile' ,style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF9A4253),
       leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button pressed
            Navigator.pushNamed(context, LoginPage.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Stack(
                children: [
                    CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        _image != null ? FileImage(File(_image!.path)) : null,
                    child: _image != null
                        ? null
                        : Icon(Icons
                            .person), // Placeholder icon if image is not available
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF9A4253),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _showPicker(context);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Name'),
                subtitle: Text(userData['name'] ?? ''),
                leading: Icon(Icons.person),
              ),
              
              ListTile(
                title: Text('Password'),
                subtitle: Text(userData['password'] ?? ''),
                leading: Icon(Icons.lock),
              ),
              ListTile(
                title: Text('Gender'),
                subtitle: Text(userData['gender'] ?? ''),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text(userData['email'] ?? ''),
                leading: Icon(Icons.mail),
              ),
              ListTile(
                title: Text('StudentID'),
                subtitle: Text(userData['studentId'] ?? ''),
                leading: Icon(Icons.code),
              ),
              ListTile(
                title: Text('Level'),
                subtitle: Text(userData['level'] ?? ''),
                leading: Icon(Icons.format_list_numbered),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(365, 48),
                    backgroundColor: Color(0xFF9A4253),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfilePage(userId: userId),
                      ),
                    ).then((_) {
                      getUserData();
                    });
                  },
                  child: const Text('Edit')),
                 const SizedBox(height: 20,),
            ],
          )
          ,
        ),
        
      ),

    );
  }
void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _imgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _image = image;
      });
      // Get user ID from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      if (userId != 0) {
        // Update user data with image path
        Map<String, dynamic> updatedUserData = {
          'imagePath': _image!.path,
        };
        // Update user in the database
        await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
      }
      print('Image Path: ${_image!.path}');
    }
  }

  void _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      setState(() {
        _image = image;
      });
      // Get user ID from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      if (userId != 0) {
        // Update user data with image path
        Map<String, dynamic> updatedUserData = {
          'imagePath': _image!.path,
        };
        // Update user in the database
        await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
      }
      print('Image Path: ${_image!.path}');
}
}
}








// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//   static String id = "ProfilePage";

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late Map<String, dynamic> userData = {};
//   late int userId;
//   XFile? _image;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _genderController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _studentIdController = TextEditingController();
//   TextEditingController _levelController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getUserIdFromLocalStorage();
//   }

//   Future<void> getUserIdFromLocalStorage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     userId = prefs.getInt('userId') ?? 0; // 0 is the default value if userId is not found
//     getUserData();
//   }

//   Future<void> getUserData() async {
//     DatabaseHelper dbHelper = DatabaseHelper();
//     Map<String, dynamic>? user = await dbHelper.getUserById(userId);
//     if (user != null) {
//       setState(() {
//         userData = user;
//         _nameController.text = userData['name'] ?? '';
//         _passwordController.text = userData['password'] ?? '';
//         _genderController.text = userData['gender'] ?? '';
//         _emailController.text = userData['email'] ?? '';
//         _studentIdController.text = userData['studentId'] ?? '';
//         _levelController.text = userData['level'] ?? '';

//         // Load image if available
//         String? imagePath = userData['imagePath'];
//         if (imagePath != null && imagePath.isNotEmpty) {
//           _image = XFile(imagePath);
//         }
//       });
//     }
//   }

//   Future<void> _updateUserData() async {
//     int userId = this.userId;
//     Map<String, dynamic> updatedUserData = {
//       'name': _nameController.text,
//       'password': _passwordController.text,
//       'gender': _genderController.text,
//       'email': _emailController.text,
//       'studentId': _studentIdController.text,
//       'level': _levelController.text,
//     };

//     await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
//     // Update UI with new data
//     getUserData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color(0xFF9A4253),
//         title: Text(
//           'Profile',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button pressed
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 70,
//                     backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         _showPicker(context);
//                       },
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFF9A4253),
//                         ),
//                         child: IconButton(
//                           onPressed: () {
//                             _showPicker(context);
//                           },
//                           icon: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   icon: Icon(Icons.person),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   icon: Icon(Icons.lock),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _genderController,
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   icon: Icon(Icons.person),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   icon: Icon(Icons.mail),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _studentIdController,
//                 decoration: InputDecoration(
//                   labelText: 'StudentID',
//                   icon: Icon(Icons.code),
//                 ),
               
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _levelController,
//                 decoration: InputDecoration(
//                   labelText: 'Level',
//                   icon: Icon(Icons.format_list_numbered),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateUserData,
//                 child: Text('Update'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                   leading: Icon(Icons.photo_library),
//                   title: Text('Photo Library'),
//                   onTap: () {
//                     _imgFromGallery();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.photo_camera),
//                   title: Text('Camera'),
//                   onTap: () {
//                     _imgFromCamera();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _imgFromGallery() async {
//     XFile? image = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (image != null) {
//       setState(() {
//         _image = image;
//       });
//       // Update user data with image path
//       await DatabaseHelper().updateUserInDatabase(userId, {'imagePath': _image!.path});
//       print('Image Path: ${_image!.path}');
//     }
//   }

//   void _imgFromCamera() async {
//     XFile? image = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//     );
//     if (image != null) {
//       setState(() {
//         _image = image;
//       });
//       // Update user data with image path
//       await DatabaseHelper().updateUserInDatabase(userId, {'imagePath': _image!.path});
//       print('Image Path: ${_image!.path}');
//     }
//   }
// }







// // import 'dart:io';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({Key? key}) : super(key: key);
// //   static String id = "ProfilePage";

// //   @override
// //   _ProfilePageState createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   late Map<String, dynamic> userData = {};
// //   late int userId;
// //   XFile? _image;

// //   @override
// //   void initState() {
// //     super.initState();
// //     getUserIdFromLocalStorage();
// //   }

// //   Future<void> getUserIdFromLocalStorage() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     userId = prefs.getInt('userId') ??
// //         0; // 0 is the default value if userId is not found
// //     getUserData();
// //   }

// //   Future<void> getUserData() async {
// //     DatabaseHelper dbHelper = DatabaseHelper();
// //     Map<String, dynamic>? user = await dbHelper.getUserById(userId);
// //     if (user != null) {
// //       setState(() {
// //         userData = user;
// //         // Load image if available
// //         String? imagePath = userData['imagePath'];
// //         if (imagePath != null && imagePath.isNotEmpty) {
// //           _image = XFile(imagePath);
// //         }
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         backgroundColor: Color(0xFF9A4253),
// //         title: Text(
// //           'Profile',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             // Handle back button pressed
// //           },
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               SizedBox(height: 20),
// //               Stack(
// //                 children: [
// //                   CircleAvatar(
// //                     radius: 70,
// //                     backgroundImage:
// //                         _image != null ? FileImage(File(_image!.path)) : null,
// //                   ),
// //                   Positioned(
// //                     bottom: 0,
// //                     right: 0,
// //                     child: GestureDetector(
// //                       onTap: () {
// //                         _showPicker(context);
// //                       },
// //                       child: Container(
// //                         width: 40,
// //                         height: 40,
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.circle,
// //                           color: Color(0xFF9A4253),
// //                         ),
// //                         child: IconButton(
// //                           onPressed: () {
// //                             _showPicker(context);
// //                           },
// //                           icon: Icon(
// //                             Icons.edit,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 20),
// //               ListTile(
// //                 title: Text('Name'),
// //                 subtitle: Text(userData['name'] ?? ''),
// //                 leading: Icon(CupertinoIcons.person),
// //               ),
// //               SizedBox(height: 10),
// //               ListTile(
// //                 title: Text('Password'),
// //                 subtitle: Text(userData['password'] ?? ''),
// //                 leading: Icon(CupertinoIcons.person),
// //               ),
// //               SizedBox(height: 10),
// //               ListTile(
// //                 title: Text('Gender'),
// //                 subtitle: Text(userData['gender'] ?? ''),
// //                 leading: Icon(CupertinoIcons.person),
// //               ),
// //               SizedBox(height: 10),
// //               ListTile(
// //                 title: Text('Email'),
// //                 subtitle: Text(userData['email'] ?? ''),
// //                 leading: Icon(CupertinoIcons.mail),
// //               ),
// //               SizedBox(height: 10),
// //               ListTile(
// //                 title: Text('StudentID'),
// //                 subtitle: Text(userData['studentId'] ?? ''),
// //                 leading: Icon(CupertinoIcons.barcode),
// //               ),
// //               SizedBox(height: 10),
// //               ListTile(
// //                 title: Text('Level'),
// //                 subtitle: Text(userData['level'] ?? ''),
// //                 leading: Icon(CupertinoIcons.number),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _showPicker(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext bc) {
// //         return SafeArea(
// //           child: Container(
// //             child: Wrap(
// //               children: <Widget>[
// //                 ListTile(
// //                   leading: Icon(Icons.photo_library),
// //                   title: Text('Photo Library'),
// //                   onTap: () {
// //                     _imgFromGallery();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.photo_camera),
// //                   title: Text('Camera'),
// //                   onTap: () {
// //                     _imgFromCamera();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _imgFromGallery() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.gallery,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //       // Get user ID from SharedPreferences
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       int userId = prefs.getInt('userId') ?? 0;
// //       if (userId != 0) {
// //         // Update user data with image path
// //         Map<String, dynamic> updatedUserData = {
// //           'imagePath': _image!.path,
// //         };
// //         // Update user in the database
// //         await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
// //       }
// //       print('Image Path: ${_image!.path}');
// //     }
// //   }

// //   void _imgFromCamera() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.camera,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //       // Get user ID from SharedPreferences
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       int userId = prefs.getInt('userId') ?? 0;
// //       if (userId != 0) {
// //         // Update user data with image path
// //         Map<String, dynamic> updatedUserData = {
// //           'imagePath': _image!.path,
// //         };
// //         // Update user in the database
// //         await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
// //       }
// //       print('Image Path: ${_image!.path}');
// // }
// // }
// // }





// // import 'dart:io';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({Key? key}) : super(key: key);
// //   static String id = "ProfilePage";

// //   @override
// //   _ProfilePageState createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   late Map<String, dynamic> userData = {};
// //   late int userId;
// //   XFile? _image;

// //   @override
// //   void initState() {
// //     super.initState();
// //     getUserIdFromLocalStorage();
// //   }

// //   Future<void> getUserIdFromLocalStorage() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     userId = prefs.getInt('userId') ??
// //         0; // 0 is the default value if userId is not found
// //     getUserData();
// //   }

// //   Future<void> getUserData() async {
// //     DatabaseHelper dbHelper = DatabaseHelper();
// //     Map<String, dynamic>? user = await dbHelper.getUserById(userId);
// //     if (user != null) {
// //       setState(() {
// //         userData = user;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         backgroundColor: Color(0xFF9A4253),
// //         title: Text(
// //           'Profile',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             // Handle back button pressed
// //           },
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
// //           children: [
// //             SizedBox(height: 20),
// //             Stack(
// //               children: [
// //                 CircleAvatar(
// //                   radius: 70,
// //                   backgroundImage:
// //                       _image != null ? FileImage(File(_image!.path)) : null,
// //                 ),
// //                 Positioned(
// //                   bottom: 0,
// //                   right: 0,
// //                   child: GestureDetector(
// //                     onTap: () {
// //                       _showPicker(context);
// //                     },
// //                     child: Container(
// //                       width: 40,
// //                       height: 40,
// //                       decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: Color(0xFF9A4253),
// //                       ),
// //                       child: IconButton(
// //                         onPressed: () {
// //                           _showPicker(context);
// //                         },
// //                         icon: Icon(
// //                           Icons.edit,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 20),
// //             ListTile(
// //               title: Text('Name'),
// //               subtitle: Text(userData['name'] ?? ''),
// //               leading: Icon(CupertinoIcons.person),
// //             ),
// //             SizedBox(height: 10),
// //             ListTile(
// //               title: Text('Gender'),
// //               subtitle: Text(userData['gender'] ?? ''),
// //               leading: Icon(CupertinoIcons.person),
// //             ),
// //             SizedBox(height: 10),
// //             ListTile(
// //               title: Text('Email'),
// //               subtitle: Text(userData['email'] ?? ''),
// //               leading: Icon(CupertinoIcons.mail),
// //             ),
// //             SizedBox(height: 10),
// //             ListTile(
// //               title: Text('StudentID'),
// //               subtitle: Text(userData['studentId'] ?? ''),
// //               leading: Icon(CupertinoIcons.barcode),
// //             ),
// //             SizedBox(height: 10),
// //             ListTile(
// //               title: Text('Level'),
// //               subtitle: Text(userData['level'] ?? ''),
// //               leading: Icon(CupertinoIcons.number),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _showPicker(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext bc) {
// //         return SafeArea(
// //           child: Container(
// //             child: Wrap(
// //               children: <Widget>[
// //                 ListTile(
// //                   leading: Icon(Icons.photo_library),
// //                   title: Text('Photo Library'),
// //                   onTap: () {
// //                     _imgFromGallery();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.photo_camera),
// //                   title: Text('Camera'),
// //                   onTap: () {
// //                     _imgFromCamera();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _imgFromGallery() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.gallery,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //       print('Image Path: ${_image!.path}');
// //     }
// //   }

// //   void _imgFromCamera() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.camera,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //       print('Image Path: ${_image!.path}');
// // }
// // }
// // }









// // // import 'package:flutter/material.dart';
// // // import 'package:sqflite/sqflite.dart';
// // // import 'package:path/path.dart';

// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: ProfilePage(),
// // //   ));
// // // }

// // // class ProfilePage extends StatefulWidget {
// // //   const ProfilePage({Key? key}) : super(key: key);

// // //   @override
// // //   _ProfilePageState createState() => _ProfilePageState();
// // // }

// // // class _ProfilePageState extends State<ProfilePage> {
// // //   late Map<String, dynamic> userData;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     userData = {}; // Initialize with an empty map

// // //     getUserData();
// // //   }

// // //   Future<void> getUserData() async {
// // //     // Get user data from SQLite database
// // //     Database database = await openDatabase(
// // //       join(await getDatabasesPath(), 'app.db'),
// // //       version: 1,
// // //     );

// // //     List<Map<String, dynamic>> users = await database.query('users');

// // //     if (users.isNotEmpty) {
// // //       setState(() {
// // //         userData = users.first;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         centerTitle: true,
// // //         backgroundColor: Color(0xFF9A4253),
// // //         title: Text(
// // //           'Profile',
// // //           style: TextStyle(color: Colors.white),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(8.0),
// // //         child: userData != null
// // //             ? ListView(
// // //                 children: [
// // //                   SizedBox(height: 20),
// // //                   CircleAvatar(
// // //                     radius: 70,
// // //                     backgroundImage: AssetImage('assets/default_profile.jpg'),
// // //                   ),
// // //                   SizedBox(height: 20),
// // //                 buildInfoTile('Name', userData['name']),
// // //                   buildInfoTile('Gender', userData['gender']),
// // //                   buildInfoTile('Email', userData['email']),
// // //                   buildInfoTile('StudentID', userData['studentId']),
// // //                   buildInfoTile('Level', userData['level']),
// // //                 ],
// // //               )
// // //             : Center(
// // //                 child: CircularProgressIndicator(),
// // //               ),
// // //       ),
// // //     );
// // //   }

// // //   Widget buildInfoTile(String title, String value) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(10),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.grey.withOpacity(0.5),
// // //             spreadRadius: 3,
// // //             blurRadius: 7,
// // //             offset: Offset(0, 3),
// // //           ),
// // //         ],
// // //       ),
// // //       child: ListTile(
// // //         title: Text(title),
// // //         subtitle: Text(value != null ? value.toString() : 'N/A'),
// // //         leading: Icon(getIconForTitle(title)),
// // //       ),
// // //     );
// // //   }

// // //   IconData getIconForTitle(String title) {
// // //     switch (title.toLowerCase()) {
// // //       case 'name':
// // //         return Icons.person;
// // //       case 'gender':
// // //         return Icons.person;
// // //       case 'email':
// // //         return Icons.mail;
// // //       case 'studentid':
// // //         return Icons.code;
// // //       case 'level':
// // //         return Icons.grade;
// // //       default:
// // //         return Icons.person;
// // //     }
// // //   }
// // // }










// // // // import 'package:flutter/material.dart';
// // // // import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';

// // // // class ProfilePage extends StatefulWidget {
// // // //   const ProfilePage({Key? key}) : super(key: key);

// // // //   @override
// // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // }

// // // // class _ProfilePageState extends State<ProfilePage> {
// // // //   late String _name;
// // // //   late String _email;
// // // //   late String _studentId;
// // // //   late String _gender;
// // // //   late String _level;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _fetchUserInfo();
// // // //   }

// // // //   Future<void> _fetchUserInfo() async {
// // // //     try {
// // // //       // Fetch user information from the database based on authenticated user's credentials
// // // //       final user = await DatabaseHelper().getUserByEmailAndPassword(
// // // //         loggedInUserEmail,
// // // //         loggedInUserPassword,
// // // //       );
      
// // // //       // Update the state with the fetched user information
// // // //       setState(() {
// // // //         _name = user?['name'];
// // // //         _email = user?['email'];
// // // //         _studentId = user?['studentId'];
// // // //         _gender = user?['gender'];
// // // //         _level = user?['level'];
// // // //       });
// // // //     } catch (e) {
// // // //       // Handle errors gracefully
// // // //       print('Error fetching user information: $e');
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Profile'),
// // // //       ),
// // // //       body: ListView(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         children: [
// // // //           ListTile(
// // // //             title: const Text('Name'),
// // // //             subtitle: Text(_name),
// // // //           ),
// // // //           ListTile(
// // // //             title: const Text('Email'),
// // // //             subtitle: Text(_email),
// // // //           ),
// // // //           ListTile(
// // // //             title: const Text('Student ID'),
// // // //             subtitle: Text(_studentId),
// // // //           ),
// // // //           ListTile(
// // // //             title: const Text('Gender'),
// // // //             subtitle: Text(_gender),
// // // //           ),
// // // //           ListTile(
// // // //             title: const Text('Level'),
// // // //             subtitle: Text(_level),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }








// // // // import 'dart:io';
// // // // import 'package:flutter/cupertino.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'package:http/http.dart' as http;

// // // // void main() {
// // // //   runApp(const MaterialApp(
// // // //     home: ProfilePage(),
// // // //   ));
// // // // }

// // // // class ProfilePage extends StatefulWidget {
// // // //   const ProfilePage({super.key});

// // // //   @override
// // // //   // ignore: library_private_types_in_public_api
// // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // }

// // // // class _ProfilePageState extends State<ProfilePage> {
// // // //   XFile? _image;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: Scaffold(
// // // //         appBar: AppBar(
// // // //           centerTitle: true,
// // // //           backgroundColor: Color(0xFF9A4253),
// // // //           title: const Text(
// // // //             'Profile',
// // // //             style: TextStyle(color: Colors.white),
// // // //           ),
// // // //           leading: IconButton(
// // // //             icon: const Icon(Icons.arrow_back),
// // // //             onPressed: () {
// // // //               // Handle back button pressed
// // // //             },
// // // //           ),
// // // //         ),
// // // //         body: Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: Column(
// // // //             children: [
// // // //               const SizedBox(
// // // //                   height: 20), // Increased gap between top and profile pic
// // // //               Stack(
// // // //                 children: [
// // // //                   CircleAvatar(
// // // //                     radius: 70,
// // // //                     backgroundImage:
// // // //                         _image != null ? FileImage(File(_image!.path)) : null,
// // // //                   ),
// // // //                   Positioned(
// // // //                     bottom: 0,
// // // //                     right: 0,
// // // //                     child: GestureDetector(
// // // //                       onTap: () {
// // // //                         _showPicker(context);
// // // //                       },
// // // //                       child: Container(
// // // //                         width: 40,
// // // //                         height: 40,
// // // //                         decoration: const BoxDecoration(
// // // //                           shape: BoxShape.circle,
// // // //                           color: Color(0xFF9A4253),
// // // //                         ),
// // // //                         child: IconButton(
// // // //                           onPressed: () {
// // // //                             _showPicker(context);
// // // //                           },
// // // //                           icon: const Icon(
// // // //                             Icons.edit,
// // // //                             color: Colors.white,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               const SizedBox(
// // // //                   height:
// // // //                       20), // Increased gap between profile pic and name ListTile
// // // //               // Wrap each ListTile with a Container and BoxDecoration
// // // //               Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.grey.withOpacity(0.5),
// // // //                       spreadRadius: 3,
// // // //                       blurRadius: 7,
// // // //                       offset: Offset(0, 3), // changes position of shadow
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: const ListTile(
// // // //                   title: Text('Name'),
// // // //                   subtitle: Text('Yasmeen Mohamed'),
// // // //                   leading: Icon(CupertinoIcons.person),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 10), // Reduced gap between ListTiles
// // // //               Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.grey.withOpacity(0.5),
// // // //                       spreadRadius: 3,
// // // //                       blurRadius: 7,
// // // //                       offset: const Offset(0, 3), // changes position of shadow
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: const ListTile(
// // // //                   title: Text('Gender'),
// // // //                   subtitle: Text('Female'),
// // // //                   leading: Icon(CupertinoIcons.person),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 10), // Reduced gap between ListTiles
// // // //               Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.grey.withOpacity(0.5),
// // // //                       spreadRadius: 3,
// // // //                       blurRadius: 7,
// // // //                       offset: const Offset(0, 3), // changes position of shadow
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: const ListTile(
// // // //                   title: Text('Email'),
// // // //                   subtitle: Text('studentID@stud.fci-cu.edu.eg'),
// // // //                   leading: Icon(CupertinoIcons.mail),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 10), // Reduced gap between ListTiles
// // // //               Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.grey.withOpacity(0.5),
// // // //                       spreadRadius: 3,
// // // //                       blurRadius: 7,
// // // //                       offset: const Offset(0, 3), // changes position of shadow
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: const ListTile(
// // // //                   title: Text('StudentID'),
// // // //                   subtitle: Text('20200633'),
// // // //                   leading: Icon(CupertinoIcons.barcode),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 10), // Reduced gap between ListTiles
// // // //               Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.grey.withOpacity(0.5),
// // // //                       spreadRadius: 3,
// // // //                       blurRadius: 7,
// // // //                       offset: const Offset(0, 3), // changes position of shadow
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: const ListTile(
// // // //                   title: Text('Level'),
// // // //                   subtitle: Text('4'),
// // // //                   leading: Icon(CupertinoIcons.number),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _showPicker(BuildContext context) {
// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       builder: (BuildContext bc) {
// // // //         return SafeArea(
// // // //           child: Container(
// // // //             child: Wrap(
// // // //               children: <Widget>[
// // // //                 ListTile(
// // // //                   leading: const Icon(Icons.photo_library),
// // // //                   title: const Text('Photo Library'),
// // // //                   onTap: () {
// // // //                     print('Photo Library tapped');
// // // //                     _imgFromGallery();
// // // //                     Navigator.of(context).pop();
// // // //                   },
// // // //                 ),
// // // //                 ListTile(
// // // //                   leading: const Icon(Icons.photo_camera),
// // // //                   title: const Text('Camera'),
// // // //                   onTap: () {
// // // //                     _imgFromCamera();
// // // //                     Navigator.of(context).pop();
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   void _imgFromGallery() async {
// // // //     XFile? image = await ImagePicker().pickImage(
// // // //       source: ImageSource.gallery,
// // // //     );
// // // //     if (image != null) {
// // // //       setState(() {
// // // //         _image = image;
// // // //       });
// // // //       print('Image Path: ${_image!.path}');
// // // //     }
// // // //   }

// // // //   void _imgFromCamera() async {
// // // //     XFile? image = await ImagePicker().pickImage(
// // // //       source: ImageSource.camera,
// // // //     );
// // // //     if (image != null) {
// // // //       setState(() {
// // // //         _image = image;
// // // //       });
// // // //       print('Image Path: ${_image!.path}');
// // // //     }
// // // //   }
// // // // }
