// import 'package:mobile_assignment/modelDB/modelDB.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class DatabaseHelper {

// 	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
// 	static Database _database;                // Singleton Database

// 	String studentTable = 'STD_table';
// 	String colId = 'id';
// 	String colName = 'name';
// 	String colGender = 'gender';
// 	String colEmail = 'email';
// 	String collevel = 'level';
//   String colPass = 'password';
//   String colConfirmPass = 'confirm pass';


// 	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

// 	factory DatabaseHelper() {

// 		if (_databaseHelper == null) {
// 			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
// 		}
// 		return _databaseHelper;
// 	}

// 	Future<Database> get database async {

// 		if (_database == null) {
// 			_database = await initializeDatabase();
// 		}
// 		return _database;
// 	}

// 	Future<Database> initializeDatabase() async {
// 		// Get the directory path for both Android and iOS to store database.
// 		Directory directory = await getApplicationDocumentsDirectory();
// 		String path = directory.path + 'student.db';

// 		// Open/create the database at a given path
// 		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
// 		return notesDatabase;
// 	}

// 	void _createDb(Database db, int newVersion) async {

// 		await db.execute('CREATE TABLE $studentTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
// 				'$colGender TEXT, $colEmail TEXT, $collevel TEXT,$colPass TEXT,$colConfirmPass TEXT )');
// 	}

// 	// Fetch Operation: Get all note objects from database
// 	Future<List<Map<String, dynamic>>> getNoteMapList() async {
// 		Database db = await this.database;

// //		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
// 		var result = await db.query(studentTable, orderBy: '$colId ASC');
// 		return result;
// 	}

// 	// Insert Operation: Insert a Note object to database
// 	Future<int> insertNote(Data note) async {
// 		Database db = await this.database;
// 		var result = await db.insert(studentTable, note.toMap());
// 		return result;
// 	}

// 	// Update Operation: Update a Note object and save it to database
// 	Future<int> updateNote(Data note) async {
// 		var db = await this.database;
// 		var result = await db.update(studentTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
// 		return result;
// 	}

// 	// Delete Operation: Delete a Note object from database
// 	Future<int> deleteNote(int id) async {
// 		var db = await this.database;
// 		int result = await db.rawDelete('DELETE FROM $studentTable WHERE $colId = $id');
// 		return result;
// 	}
// //////////////////////
// 	// Get number of Note objects in database
// 	Future<int?> getCount() async {
// 		Database db = await this.database;
// 		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $studentTable');
// 		int? result = Sqflite.firstIntValue(x);
// 		return result;
// 	}

// 	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
// 	Future<List<Data>> getNoteList() async {

// 		var noteMapList = await getNoteMapList(); // Get 'Map List' from database
// 		int count = noteMapList.length;         // Count the number of map entries in db table

// 		List<Data> DataList = List<Data>();
// 		// For loop to create a 'Note List' from a 'Map List'
// 		for (int i = 0; i < count; i++) {
// 			DataList.add(Data.fromMapObject(noteMapList[i]));
// 		}

// 		return DataList;
// 	}

// }





// // db.rawQ
