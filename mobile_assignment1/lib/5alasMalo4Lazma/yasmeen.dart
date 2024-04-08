// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MobileApp(),
//   ));
// }


// class MobileApp extends StatelessWidget {
//   const MobileApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color(0xFF9A4253),
//           title: Text(
//             'Profile',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               // Handle back button pressed
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20), // Increased gap between top and profile pic
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 70,
//                    // backgroundImage: AssetImage('images/profile.jpg'),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         _showPicker(context);
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFF9A4253),
//                         ),
//                         child:IconButton(onPressed:(){_showPicker(context);}, icon: Icon(Icons.edit,color: Colors.white,)),
//                         // child: Icon(
//                         //   Icons.edit,
//                         //   color: Colors.white,
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                   height:
//                       20), // Increased gap between profile pic and name ListTile
//               // Wrap each ListTile with a Container and BoxDecoration
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: const Text('Name'),
//                   subtitle: const Text('Yasmeen Mohamed'),
//                   leading: Icon(CupertinoIcons.person),
//                 ),
//               ),
//               SizedBox(height: 10), // Reduced gap between ListTiles
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: const Text('Gender'),
//                   subtitle: const Text('Female'),
//                   leading: Icon(CupertinoIcons.person),
//                 ),
//               ),
//               SizedBox(height: 10), // Reduced gap between ListTiles
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: const Text('Email'),
//                   subtitle: const Text('studentID@stud.fci-cu.edu.eg'),
//                   leading: Icon(CupertinoIcons.mail),
//                 ),
//               ),
//               SizedBox(height: 10), // Reduced gap between ListTiles
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: const Text('StudentID'),
//                   subtitle: const Text('20200633'),
//                   leading: Icon(CupertinoIcons.barcode),
//                 ),
//               ),
//               SizedBox(height: 10), // Reduced gap between ListTiles
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: const Text('Level'),
//                   subtitle: const Text('4'),
//                   leading: Icon(CupertinoIcons.number),
//                 ),
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
//     // Handle the picked image here
//   }

//   void _imgFromCamera() async {
//     XFile? image = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//     );
//     // Handle the picked image here
// }
// }






// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MobileApp());
// // }

// // class MobileApp extends StatelessWidget {
// //   const MobileApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Profile'), // Title of the app bar
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               const SizedBox(
// //                   height: 20), // Increased gap between top and profile pic
// //               const CircleAvatar(
// //                 radius: 70,
// //                // backgroundImage: AssetImage('images/profile.jpg'),
// //               ),
// //               const SizedBox(
// //                   height:
// //                       20), // Increased gap between profile pic and name ListTile
// //               // Wrap each ListTile with a Container and BoxDecoration
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 3,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3), // changes position of shadow
// //                     ),
// //                   ],
// //                 ),
// //                 child: const ListTile(
// //                   title: Text('Name'),
// //                   subtitle: Text('Yasmeen Mohamed'),
// //                   leading: Icon(CupertinoIcons.person),
// //                 ),
// //               ),
// //               const SizedBox(height: 10), // Reduced gap between ListTiles
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 3,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3), // changes position of shadow
// //                     ),
// //                   ],
// //                 ),
// //                 child: const ListTile(
// //                   title: Text('Gender'),
// //                   subtitle: Text('Female'),
// //                   leading: Icon(CupertinoIcons.person),
// //                 ),
// //               ),
// //               const SizedBox(height: 10), // Reduced gap between ListTiles
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 3,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3), // changes position of shadow
// //                     ),
// //                   ],
// //                 ),
// //                 child: const ListTile(
// //                   title: Text('Email'),
// //                   subtitle: Text('studentID@stud.fci-cu.edu.eg)'),
// //                   leading: Icon(CupertinoIcons.mail),
// //                 ),
// //               ),
// //               const SizedBox(height: 10), // Reduced gap between ListTiles
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 3,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3), // changes position of shadow
// //                     ),
// //                   ],
// //                 ),
// //                 child: const ListTile(
// //                   title: Text('StudentID'),
// //                   subtitle: Text('20200633'),
// //                   leading: Icon(CupertinoIcons.barcode),
// //                 ),
// //               ),
// //               const SizedBox(height: 10), // Reduced gap between ListTiles
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10), // Rounded corners
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 3,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3), // changes position of shadow
// //                     ),
// //                   ],
// //                 ),
// //                 child: const ListTile(
// //                   title: Text('Level'),
// //                   subtitle: Text('4'),
// //                   leading: Icon(CupertinoIcons.number),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
