// class Data {
//    late String name;
//   late String gender;
//   late String email;
//   late String level;
//   late String studentId;
//   late String password;
//   late String confirmPassword;
//   Data({
//     required this.name,
//     required this.gender,
//     required this.email,
//     required this.level,
//     required this.studentId,
//     required this.password,
//     required this.confirmPassword,
//   });
//   Data.id({
//     required this.name,
//     required this.gender,
//     required this.email,
//     required this.level,
//     required this.studentId,
//     required this.password,
//     required this.confirmPassword,
//   });

//   String get id => studentId;

//   String get fullname => name;

//   String get genderFM => gender;

//   String get mail => email;

//   String get levelg => level;

//   String get pass => password;

//   String get confirmPass => confirmPassword;

//   set fullname(String newfullname) {
//     if (newfullname.length <= 255) {
//       this.name = newfullname;
//     }
//   }

//   set genderfm(String newgender) {
//     if (newgender.length <= 255) {
//       this.gender = newgender;
//     }
//   }
// set mail(String newemail) {
//     if (newemail.length <= 255) {
//       this.email = newemail;
//     }
//   }
//   set levelg(String newlevel) {
//     if (newlevel.length <= 255) {
//       this.email = newlevel;
//     }
//   }
//   set pass(String newpass) {
//     if (newpass.length <= 255) {
//       this.email = newpass;
//     }
//   }
//   set confirmPass(String newconfirmpass) {
//     if (newconfirmpass.length <= 255) {
//       this.email = newconfirmpass;
//     }
//   }
  

//   // Convert a Note object into a Map object
//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = studentId;
//     }
//     map['name'] = name;
//     map['gender'] = gender;
//     map['email'] = email;
//     map['level'] = level;
//     map['password'] = password;
//     map['confirm pass'] = confirmPassword;

//     return map;
//   }

//   // Extract a Note object from a Map object
//   Data.fromMapObject(Map<String, dynamic> map) {
//     this.studentId = map['id'];
//     this.name = map['name'];
//     this.gender = map['gender'];
//     this.email = map['email'];
//     this.level = map['level'];
//     this.password= map['password'] ;
//     this.confirmPassword=map['confirm pass'];

//   }
// }
