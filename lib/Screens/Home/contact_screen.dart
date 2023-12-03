import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/UI%20Components/team_images_widget.dart';
import 'package:sgs/Utils/Main_Variables.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(mainColor),
        title: const Text('Contact Us'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              ContactContainer(imagePath: 'assets/Team Photos/Mostafa.jpg', name: 'Mostafa Ibrahim', email: 'mostafagameover595@gmail.com'),
              SizedBox(
                height: 15,
              ),
              ContactContainer(imagePath: 'assets/Team Photos/Mody.jpg', name: 'Mohamad Abdallah', email: 'mo.a.s.ali.eg@gmail.com'),
              SizedBox(
                height: 15,
              ),
              ContactContainer(imagePath: 'assets/Team Photos/Belal.jpg', name: 'Belal Hassan', email: 'belal.34327@gmail.com'),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
