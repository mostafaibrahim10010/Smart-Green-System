import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Utils/Main_Variables.dart';

class AuthTextFormField extends StatelessWidget {
  AuthTextFormField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.isPassword,
      this.inputType})
      : super(key: key);

  TextEditingController controller = TextEditingController();
  final String hint;
  bool isPassword;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        cursorColor: HexColor(mainColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45), //<-- SEE HERE
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}
