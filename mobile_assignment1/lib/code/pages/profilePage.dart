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
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
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
