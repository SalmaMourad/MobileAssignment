// ignore: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:mobile_assignment/code/constansts%20and%20fields/constants.dart';

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
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        children: [
          const Icon(
            Icons.bar_chart_outlined,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 50,
          ),
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
