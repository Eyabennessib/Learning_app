import 'package:dummy_app/core/routers.dart';
import 'package:flutter/material.dart';

import '../../../core/themes.dart';

class AssessmentScreen extends StatefulWidget{
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState()=> _AssessmentScreen();
}

class _AssessmentScreen extends State<AssessmentScreen>{

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
                    "Start of Assessment",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      goToHome(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: AppColors.mainColor,
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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