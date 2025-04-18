import 'package:dummy_app/core/routers.dart';
import 'package:flutter/material.dart';

import '../../../core/themes.dart';

class IntroScreen extends StatefulWidget{
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState()=> _IntroScreen();
}

class _IntroScreen extends State<IntroScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), (){
      goToAssessment(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width,
                    // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    margin: const EdgeInsets.only(top: 80.0),
                    child: Image.asset(
                      'assets/mascot-transparent.png',
                      width: MediaQuery.of(context).size.width * 0.1,  // 80% of screen width
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Intro Video",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
          )
      ),
    );
  }
}