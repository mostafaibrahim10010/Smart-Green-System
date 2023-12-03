import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sgs/Screens/Data%20Managment/data_managment_screen.dart';
import 'package:sgs/Utils/Main_Variables.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:sgs/Screens/Home/contact_screen.dart';
import 'package:sgs/Screens/Machine%20Learning%20Screens/Main_ML_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(mainColor),
        title: const Text('Home Page'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: 67,
        width: 67,
        child: FloatingActionButton(
          backgroundColor: HexColor(mainColor),
          onPressed: () {
            launcher.launchUrl(
              Uri.parse('https://poe.com/'),
              mode: launcher.LaunchMode.externalApplication,
            );
          },
          child: const Icon(Icons.chat),
        ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            height: 41,
                            width: 160,
                            child: Text(
                              "Hi, Visitor",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                              height: 41,
                              width: 41,
                              child: Image.asset("assets/Others/hello.png"))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                          height: 38,
                          width: 197,
                          child: Text(
                              "Cultivating Tomorrow: Empowering Agriculture with Smart Green Solutions.")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor(mainColor),
                        borderRadius: BorderRadius.circular(10)),
                    height: 120,
                    width: 104,
                    child: SizedBox(
                        height: 200,
                        width: 280,
                        child: Image.asset("assets/Others/greenhouse.png")),
                  )
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 175,
                    child: ElevatedButton(
                      onPressed: () {
                        launcher.launchUrl(
                          Uri.parse(
                              'mailto:smartgreensystem0@gmail.com?subject=For inquiries about the Smart Green System&body=I want to ask about....'),
                          mode: launcher.LaunchMode.externalApplication,
                        );
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
                            child:
                                Image.asset('assets/Others/discord-logo.png'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text('Discord'),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
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
                            launcher.launchUrl(
                              Uri.parse(
                                  'https://www.linkedin.com/company/smart-green-system/'),
                              mode: launcher.LaunchMode.externalApplication,
                            );
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
                                    'assets/Others/social-media.png'),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Social Media'),
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
                            launcher.launchUrl(
                              Uri.parse(
                                  'mailto:smartgreensystem0@gmail.com?subject=For inquiries about the Smart Green System&body=I want to ask about....'),
                              mode: launcher.LaunchMode.externalApplication,
                            );
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
                                child: Image.asset('assets/Others/gmail.png'),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Contact Us'),
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
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: HexColor(mainColor),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: HexColor(mainColor)),
                currentAccountPicture: Image.asset('assets/Others/Logo.jpg'),
                currentAccountPictureSize: const Size.square(45),
                accountName: const Text(
                  "Smart Green System",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(user.email!),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.auto_graph_outlined),
              title: const Text(' Track Your Progress '),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const DataScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety_outlined),
              title: const Text(' AI Health Detector '),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const MLScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text(' Contact Us '),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ContactScreen()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: handleLoginOutPopup),
          ],
        ),
      ), //Drawer,
    );
  }

  handleLoginOutPopup() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Login Out",
      desc: "Do you want to login out now?",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: HexColor(mainColor),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: signUserOut,
          color: HexColor(mainColor),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
