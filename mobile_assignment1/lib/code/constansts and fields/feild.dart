
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/form.dart' as r;
import 'package:mobile_assignment/code/constansts%20and%20fields/constants.dart';

// ignore: must_be_immutable
class Feild extends StatelessWidget {
  Feild(
      {super.key,
      required this.text,
      required this.icon,
      this.controller,
      this.fieldValidator});

  String text;
  Icon icon;
  TextEditingController? controller;
FormFieldValidator<String>? fieldValidator;
//final String? Function(String?)? fieldValidator;

String FieldValidatorr(String value ){
  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else {
                    print("here is else");
                    if (value.length < 8) {
                      
                      return 'your password must be eigth or more';
                      // MinLengthValidator(8,
                      //     errorText: 'Password must be at least 4 digit');
                    }
                    // MinLengthValidator(8,
                    //     errorText: 'Password must be at least 4 digit');
                  }
                   return 'done';

}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        children: [
          // Image.asset('lib/assets/icons/user.png'),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              focusColor: kprimaryColourGreen,
              icon: icon, // User icon on the left
              labelText: text,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA6A5A4), width: 1.5),
              ),
            ),
            validator: fieldValidator,
          ),
        ],
      ),
    );
  }
}



//import 'package:flutter/material.dart';
// import 'package:gp_screen/widgets/constantsAcrossTheApp/constants.dart';

// class Feild extends StatefulWidget {
//   final String text;
//   final Icon icon;
//   final TextEditingController? controller;
//   final FormFieldValidator<String>? fieldValidator;

//   const Feild({
//     required this.text,
//     required this.icon,
//     this.controller,
//     this.fieldValidator,
//   });

//   @override
//   _FeildState createState() => _FeildState();
// }

// class _FeildState extends State<Feild> {
//   bool _showGenderOptions = false; // To control the visibility of gender options

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 40, right: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _showGenderOptions = !_showGenderOptions;
//               });
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.text,
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.person,
//                       size: 24,
//                     ),
//                     SizedBox(width: 8),
//                     Text('Select gender'),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       size: 24,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           if (_showGenderOptions) // Render gender options if _showGenderOptions is true
//             Column(
//               children: [
//                 RadioListTile(
//                   title: Text('Male'),
//                   value: 'male',
//                   groupValue: null, // You need to manage the state to handle selection
//                   onChanged: (value) {
//                     // Handle male selection
//                   },
//                 ),
//                 RadioListTile(
//                   title: Text('Female'),
//                   value: 'female',
//                   groupValue: null, // You need to manage the state to handle selection
//                   onChanged: (value) {
//                     // Handle female selection
//                   },
//                 ),
//               ],
//             ),
//           TextFormField(
//             controller: widget.controller,
//             decoration: InputDecoration(
//               focusColor: kprimaryColourGreen,
//               icon: widget.icon,
//               labelText: widget.text,
//               border: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFFA6A5A4), width: 1.5),
//               ),
//             ),
//             validator: widget.fieldValidator,
//           ),
//         ],
//       ),
//     );
//   }
// }










//working but only here :
  	// validator: MultiValidator([ 
		// 							RequiredValidator( 
		// 								errorText: 'Enter email address'), 
		// 							EmailValidator( 
		// 								errorText: 
		// 									'Please correct email filled'), 
		// 						]),

// validator: MultiValidator([ 
// 								RequiredValidator( 
// 									errorText: 'Please enter Password'), 
// 								MinLengthValidator(4, 
// 									errorText: 
// 										'Password must be at least 4 digit'), 
// 								// PatternValidator(r'(?=.*?[#!@$%^&*-])', 
// 								// 	errorText: 
// 								// 		'Password must be at least one special character') 
// 							]), 

//             // validator: (data) {
//             //   if (data !="salma")
//             //   {
//             //     return 'value is wrong';
//             //   }
              
//             //},