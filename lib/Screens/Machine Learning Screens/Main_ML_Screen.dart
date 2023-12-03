import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Screens/Home/home_screen.dart';

import 'package:sgs/Screens/Machine%20Learning%20Screens/ML_Screens/ML_all.dart';
import 'package:sgs/Screens/Machine%20Learning%20Screens/ML_Screens/ML_lettuce.dart';
import 'package:sgs/Screens/Machine%20Learning%20Screens/ML_Screens/ML_mint.dart';
import 'package:sgs/Screens/Machine%20Learning%20Screens/ML_Screens/ML_tomato.dart';
import 'package:sgs/Utils/Main_Variables.dart';

import '../../Utils/Plant_Images.dart';

class MLScreen extends StatefulWidget {
  const MLScreen({Key? key}) : super(key: key);

  @override
  State<MLScreen> createState() => _MLScreenState();
}

class _MLScreenState extends State<MLScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Health Detector'),
        backgroundColor: HexColor(mainColor),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop(MaterialPageRoute(
              builder: (BuildContext context) =>
              const HomeScreen()));
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                child: Image.asset('assets/Others/ai.png'),
              ),
              const SizedBox(
                height: 55,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 175,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MLAllScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: HexColor(mainColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 134,
                                width: 134,
                                child: Image.asset(plant),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Plant Detector'),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 175,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MLTomatoScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: HexColor(mainColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 134,
                                width: 134,
                                child: Image.asset(
                                    tomato),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Tomato Health'),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 175,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MLMintScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: HexColor(mainColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 134,
                                width: 134,
                                child: Image.asset(
                                    mint),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Mint Health'),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 175,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MLLettuceScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: HexColor(mainColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 134,
                                width: 134,
                                child: Image.asset(
                                    lettuce),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Lettuce Health'),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
