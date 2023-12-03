import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../Utils/Main_Variables.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.email})
      : super(key: key);

  final String imagePath;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: HexColor(mainColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(height: 200, width: 200, child: Image.asset(imagePath)),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                launcher.launchUrl(
                  Uri.parse(
                      'mailto:$email?subject=For inquiries about the Smart Green System&body=I want to ask about....'),
                  mode: launcher.LaunchMode.externalApplication,
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white // Background color
                  ),
              child: Text(
                'Contact Me',
                style: TextStyle(color: HexColor(mainColor)),
              )),
        ],
      ),
    );
  }
}
