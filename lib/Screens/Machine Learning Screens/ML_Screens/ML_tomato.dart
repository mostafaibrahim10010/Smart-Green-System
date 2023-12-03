import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Utils/Main_Variables.dart';
import 'package:sgs/Utils/Plant_Images.dart';

import '../ML_camera.dart';

class MLTomatoScreen extends StatefulWidget {
  const MLTomatoScreen({Key? key}) : super(key: key);

  @override
  State<MLTomatoScreen> createState() => _MLTomatoScreenState();
}

class _MLTomatoScreenState extends State<MLTomatoScreen> {
  loadmodel() async {
    Tflite.loadModel(
      model: "assets/tomato_model_unquant.tflite",
      labels: "assets/tomato_labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();

    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor(mainColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(tomato),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              color: HexColor(mainColor),
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 50,
                width: w,
                child: MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Start Detecting', style: TextStyle(color: HexColor(mainColor)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
