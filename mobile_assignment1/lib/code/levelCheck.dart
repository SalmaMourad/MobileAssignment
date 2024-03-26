// ignore: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:mobile_assignment/code/constants.dart';

class levelCheck extends StatefulWidget {
  const levelCheck({
    Key? key, // Corrected parameter name
  }) : super(key: key); // Corrected super call

  @override
  _levelCheckState createState() => _levelCheckState();
}

class _levelCheckState extends State<levelCheck> {
  @override
  void initState() {
    super.initState();
  }

  String dropDownValue = "level";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: Row(
        
        children: [
          const Icon(Icons.bar_chart_outlined,color: Colors.grey,),
          const SizedBox(height: 50,),
        //  Spacer(flex: 1,),
          Container(
            child: Expanded(
              child: DropdownButton<String>(
              //  elevation: 4,
                value: dropDownValue,
                icon: const Icon(Icons.arrow_drop_down),
                underline: Container(
                  height: 1.5,
                  color: const Color.fromARGB(255, 183, 183, 183),
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropDownValue = value!;
                    levelController.text = value;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: "level",
                    child: Text('level'),
                  ),
                  DropdownMenuItem<String>(
                    value: "one",
                    child: Text('one'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'two',
                    child: Text('two'),
                  ),
                  DropdownMenuItem<String>(
                    value: "three",
                    child: Text('three'),
                  ),
                  DropdownMenuItem<String>(
                    value: "four",
                    child: Text('four'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// // ignore: constant_identifier_names
// import 'package:flutter/material.dart';
// import 'package:gp_screen/new/constants.dart';

// class levelCheck extends StatefulWidget {
//   const levelCheck({
//     super.key,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _levelCheckState createState() => _levelCheckState();
// }

// class _levelCheckState extends State<levelCheck> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   String dropDownValue = "one";
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropDownValue,
//       icon: const Icon(Icons.pin_drop),
//       underline: Container(
//         height: 2,
//         color: Colors.grey,
//       ),
//       onChanged: (String? value) {
//         setState(() {
//           dropDownValue = value!;
//           levelController.text = value;
//         });
//       },
//       items: const [
//         DropdownMenuItem<String>(
//           value: "one",
//           child: Text('one'),
//         ),
//         DropdownMenuItem<String>(
//           value:  'two',
//           child: Text('two'),
//         ),
//         DropdownMenuItem<String>(
//           value: "three",
//           child: Text('three'),
//         ),
//         DropdownMenuItem<String>(
//           value: "four",
//           child: Text('four'),
//         ),
//       ],
//     );
//   }
// }
// // // PopupMenuButton<Priority>(
// //       onSelected: (Priority value) {
// //         setState(() {
// //           priority = value;
// //           widget.task.priority = value;
// //           // toDoLists[listIndex].tasks[taskIndex].priority = value!;
// //         });
// //       },

// //       itemBuilder: (BuildContext context) => <PopupMenuEntry<Priority>>[
// //         const PopupMenuItem(
// //           value: Priority.high,
// //           child: ListTile(
// //             leading: Icon(Icons.flag, color: Colors.red),
// //             title: Text('High Priority'),
// //           ),
// //         ),
// //         const PopupMenuItem(
// //           value: Priority.normal,
// //           child: ListTile(
// //             leading: Icon(Icons.flag, color: Colors.yellow),
// //             title: Text('Normal Priority'),
// //           ),
// //         ),
// //         const PopupMenuItem(
// //           value: Priority.low,
// //           child: ListTile(
// //             leading: Icon(Icons.flag, color: Colors.green),
// //             title: Text('Low Priority'),
// //           ),
// //         ),
// //       ],
// //       child: Icon(
// //         Icons.flag,
// //         color: priority == Priority.high
// //             ? Colors.red
// //             : priority == Priority.normal
// //                 ? Colors.yellow
// //                 : Colors.green,
// //       ),
// //       // Icon(Icons.keyboard_arrow_down),
// //     );