import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Utils/Main_Variables.dart';
import '../../UI Components/auth_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
                child: CircularProgressIndicator(
              color: HexColor(mainColor),
            )));
    try {
      if (passController.text == confirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
      } else {
        //Alert
      }
    } on FirebaseAuthException catch (e) {
      //Alert
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(mainColor),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/Others/Logo.jpg')),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 45),
                  child: Text(
                    "Smart Green System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              AuthTextFormField(
                hint: 'Email',
                controller: emailController,
                isPassword: false,
              ),
              AuthTextFormField(
                hint: 'Password',
                controller: passController,
                isPassword: true,
              ),
              AuthTextFormField(
                hint: 'Confirm Password',
                controller: confirmPassController,
                isPassword: true,
              ),
              SizedBox(
                width: 140,
                height: 45,
                child: ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.white // Background color
                        ),
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(color: HexColor(mainColor), fontSize: 22),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
