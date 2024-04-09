import 'package:flutter/material.dart';
import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';
import 'package:mobile_assignment/code/constansts%20and%20fields/constants.dart';

class UpdateProfilePage extends StatefulWidget {
  final int userId;

  const UpdateProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _genderController;
  late TextEditingController _emailController;
  late TextEditingController _studentIdController;
  late TextEditingController _levelController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _genderController = TextEditingController();
    _emailController = TextEditingController();
    _studentIdController = TextEditingController();
    _levelController = TextEditingController();
    getUserData();
  }

  Future<void> getUserData() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    Map<String, dynamic>? user = await dbHelper.getUserById(widget.userId);
    if (user != null) {
      setState(() {
        _nameController.text = user['name'] ?? '';
        _passwordController.text = user['password'] ?? '';
        _genderController.text = user['gender'] ?? '';
        _emailController.text = user['email'] ?? '';
        _studentIdController.text = user['studentId'] ?? '';
        _levelController.text = user['level'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        backgroundColor: Color(0xFF9A4253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID'),
              ),
              TextFormField(
                controller: _levelController,
                decoration: InputDecoration(labelText: 'Level'),
              ),
              SizedBox(height: 20),
              ElevatedButton( 
                style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 48),
                      backgroundColor: Color(0xFF9A4253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                onPressed: _updateUserData,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _updateUserData() async {
    int userId = widget.userId;
    Map<String, dynamic> updatedUserData = {
      'name': _nameController.text,
      'password': _passwordController.text,
      'gender': _genderController.text,
      'email': _emailController.text,
      'studentId': _studentIdController.text,
      'level': _levelController.text,
    };

    await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
    Navigator.pop(context);
  }
}


// import 'package:flutter/material.dart';
// import 'package:mobile_assignment/code/DataBaseHelper/DatabaseHelper.dart';

// class UpdateProfilePage extends StatefulWidget {
//   final int userId;

//   const UpdateProfilePage({Key? key, required this.userId}) : super(key: key);

//   @override
//   _UpdateProfilePageState createState() => _UpdateProfilePageState();
// }

// class _UpdateProfilePageState extends State<UpdateProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _passwordController;
//   late TextEditingController _genderController;
//   late TextEditingController _emailController;
//   late TextEditingController _studentIdController;
//   late TextEditingController _levelController;

//   @override
//   void initState() {
//     super.initState();
//     getUserData();
//   }

//   Future<void> getUserData() async {
//     DatabaseHelper dbHelper = DatabaseHelper();
//     Map<String, dynamic>? user = await dbHelper.getUserById(widget.userId);
//     if (user != null) {
//       _nameController = TextEditingController(text: user['name'] ?? '');
//       _passwordController = TextEditingController(text: user['password'] ?? '');
//       _genderController = TextEditingController(text: user['gender'] ?? '');
//       _emailController = TextEditingController(text: user['email'] ?? '');
//       _studentIdController = TextEditingController(text: user['studentId'] ?? '');
//       _levelController = TextEditingController(text: user['level'] ?? '');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               TextFormField(
//                 controller: _genderController,
//                 decoration: InputDecoration(labelText: 'Gender'),
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextFormField(
//                 controller: _studentIdController,
//                 decoration: InputDecoration(labelText: 'Student ID'),
//               ),
//               TextFormField(
//                 controller: _levelController,
//                 decoration: InputDecoration(labelText: 'Level'),
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

//   void _updateUserData() async {
//     int userId = widget.userId;
//     Map<String, dynamic> updatedUserData = {
//       'name': _nameController.text,
//       'password': _passwordController.text,
//       'gender': _genderController.text,
//       'email': _emailController.text,
//       'studentId': _studentIdController.text,
//       'level': _levelController.text,
//     };

//     await DatabaseHelper().updateUserInDatabase(userId, updatedUserData);
//     Navigator.pop(context);
//   }
// }
