
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static Database? _database;
//     static const String dbName = 'user.db';
//       static const String TableName = 'user';



//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//         String databasePath = await getDatabasesPath();

//     print("Location :" + databasePath);
//     String path = join(await getDatabasesPath(), dbName);
//     return openDatabase(
//       join(await getDatabasesPath(), 'user.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertUser(User user) async {
//     final Database db = await database;
//     await db.insert(
//       'users',
//       user.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }

// class User {
//   final String name;
//   final String email;

//   User({required this.name, required this.email});

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'email': email,
//     };
//   }
// }

// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:mobile_assignment/code/newUserModel.dart';

// // class DatabaseHelper {
// //   static final DatabaseHelper _instance = DatabaseHelper.internal();

// //   factory DatabaseHelper() => _instance;

// //   static Database? _db;

// //   DatabaseHelper.internal();

// //   Future<Database> get db async {
// //     if (_db != null) {
// //       return _db!;
// //     }
// //     _db = await initDb();
// //     return _db!;
// //   }

// //   Future<Database> initDb() async {
// //     Directory documentDirectory = await getApplicationDocumentsDirectory();
// //     String path = join(documentDirectory.path, "user.db");
// //     var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
// //     return ourDb;
// //   }

// //   void _onCreate(Database db, int version) async {
// //     await db.execute(
// //         "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, email TEXT, studentId TEXT, password TEXT, gender TEXT, level TEXT)");
// //     print("Table is created");
// //   }

// //   Future<int> saveUser(UserModel user) async {
// //     var dbClient = await db;
// //     int res = await dbClient.insert("User", user.toMap());
// //     return res;
// //   }
// // }













// // // class SignUpPagee extends StatefulWidget {
// // //   const SignUpPagee({super.key});
// // //   static String id = "SignUpPagee";

// // //   @override
// // //   State<SignUpPagee> createState() => _SignUpPageeState();
// // // }

// // // class _SignUpPageeState extends State<SignUpPagee> {
// // //   late DatabaseHelper databaseHelper;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     databaseHelper = DatabaseHelper();
// // //   }

// // //   // Rest of your code

// // //   // @override
// // //   // Widget build(BuildContext context) {
// // //   //   // Your build method code
// // //   // }

// // //   void addUserToDatabase(UserModel user) async {
// // //     int result = await databaseHelper.saveUser(user);
// // //     if (result != 0) {
// // //       // Success
// // //       print("User added to database successfully");
// // //     } else {
// // //       // Failure
// // //       print("Failed to add user to database");
// // //     }
// // //   }

// // //   // Your other methods
// // // }
