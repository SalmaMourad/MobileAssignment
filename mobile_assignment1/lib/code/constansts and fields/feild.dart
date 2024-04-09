import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/form.dart' as r;
import 'package:mobile_assignment/code/constansts%20and%20fields/constants.dart';

// ignore: must_be_immutable
class Feild extends StatefulWidget {
  Feild({
    super.key,
    required this.text,
    required this.icon,
    this.controller,
    this.fieldValidator,
    this.isPassword = false,
  });

  String text;
  Icon icon;
  TextEditingController? controller;
  FormFieldValidator<String>? fieldValidator;
  final bool isPassword;
  @override
  State<Feild> createState() => _FeildState();
}

class _FeildState extends State<Feild> {
  bool _obscureText = true;
//final String? Function(String?)? fieldValidator;
  String FieldValidatorr(String value) {
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
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              focusColor: kprimaryColourGreen,
              icon: widget.icon, // User icon on the left
              labelText: widget.text,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA6A5A4), width: 1.5),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null, // If it's not a password field, set to null
            ),
            validator: widget.fieldValidator,
          ),
        ],
      ),
    );
  }
}
