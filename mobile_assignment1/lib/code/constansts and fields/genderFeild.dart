import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/form.dart' as r;
import 'package:mobile_assignment/code/constansts%20and%20fields/constants.dart';

// ignore: must_be_immutable
class genderFeild extends StatefulWidget {
  genderFeild({
    super.key,
  });

  @override
  State<genderFeild> createState() => _genderFeildState();
}

class _genderFeildState extends State<genderFeild> {
  String selectedGender = '';

  // Add this line
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 45, right: 45),
      child: Column(
        children: [
          // Image.asset('lib/assets/icons/user.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.male,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Gender:",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              RadioListTile(
                title: const Text(
                  'Male',
                  style: TextStyle(color: Colors.grey),
                ),
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                    genderController.text = selectedGender;
                  });
                },
              ),
              RadioListTile(
                title:
                    const Text('Female', style: TextStyle(color: Colors.grey)),
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                    genderController.text = selectedGender;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
