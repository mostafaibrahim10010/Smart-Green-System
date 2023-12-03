import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Utils/Main_Variables.dart';

class DataTextFieldForm extends StatelessWidget {
  DataTextFieldForm({Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  final String hint;


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
      ),
    );
  }
}

