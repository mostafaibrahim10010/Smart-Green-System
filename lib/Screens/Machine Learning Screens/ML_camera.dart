import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Utils/Main_Variables.dart';

import 'Main_ML_Screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String answer = "";
  CameraController? cameraController;
  CameraImage? cameraImage;

  initCamera() {
    cameraController = CameraController(
        const CameraDescription(
          name: '0', // 0 for back camera and 1 for front camera
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 0,
        ),
        ResolutionPreset.medium);

    cameraController!.initialize().then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(
          () {
            cameraController!.startImageStream(
              (image) => {
                if (true)
                  {
                    cameraImage = image,
                    applymodelonimages(),
                  }
              },
            );
          },
        );
      },
    );
  }

  applymodelonimages() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map(
            (plane) {
              return plane.bytes;
            },
          ).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 3,
          threshold: 0.1,
          asynch: true);

      answer = '';

      predictions!.forEach(
        (prediction) {
          answer +=
              prediction['label'].toString().substring(0, 1).toUpperCase() +
                  prediction['label'].toString().substring(1) +
                  " " +
                  (prediction['confidence'] as double).toStringAsFixed(3) +
                  '\n';
        },
      );

      setState(
        () {
          answer = answer;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    // loadmodel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (BuildContext context) => const MLScreen()));
              }, icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'AI Detection',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: HexColor(mainColor),
        ),
        body: cameraImage != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Positioned(
                      child: Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(
                              cameraController!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.black87,
                          child: Center(
                            child: Text(
                              answer,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
