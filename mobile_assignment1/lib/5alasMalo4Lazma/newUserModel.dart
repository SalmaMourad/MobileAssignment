// class UserModel {
//   String? name;
//   String? gender;
//   String? email;
//   String? level;
//   String? studentId;
//   String? password;
//   String? confirmPassword;

//   UserModel({
//     required this.name,
//     required this.gender,
//     required this.email,
//     required this.level,
//     required this.studentId,
//     required this.password,
//     required this.confirmPassword,
//   });

// Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       'name': name,
//       'email': email,
//       'studentId': studentId,
//       'password': password,
//       'gender': gender,
//       'level': level,
//     };
//     return map;
//   }

//   UserModel.fromMap(Map<String, dynamic> map) {
//     name = map['name'];
//     email = map['email'];
//     studentId = map['studentId'];
//     password = map['password'];
//     gender = map['gender'];
//     level = map['level'];
//   }

//  // Map<String, Object?> toMap() {}
// }

// List<UserModel> persons = [];

// // Function to add a new user
// void addUser(String name, String gender, String email, String level,
//     String studentId, String password, String confirmPassword) {
//   UserModel newUser = UserModel(
//     name: name,
//     gender: gender,
//     email: email,
//     level: level,
//     studentId: studentId,
//     password: password,
//     confirmPassword: confirmPassword,
//   );
//   persons.add(newUser);
// }

// //check if the user exists
// bool checkIfUserExists(List<UserModel> users, String email) {
//   for (UserModel user in users) {
//     if (user.email == email) {
//       return true; // User with the given email exists
//     }
//   }
//   return false; // User with the given email does not exist
// }
// bool checkIfUserExistsByID(List<UserModel> users, String id) {
//   for (UserModel user in users) {
//     if (user.studentId == id) {
//       return true; // User with the given email exists
//     }
//   }
//   return false; // User with the given email does not exist
// }
// //check if the password is right
// bool checkIfPasswordRight(List<UserModel> users, String password) {
//   for (UserModel user in users) {
//     if (user.password == password) {
//       return true; // User with the given email exists
//     }
//   }
//   return false; // User with the given email does not exist
// }
