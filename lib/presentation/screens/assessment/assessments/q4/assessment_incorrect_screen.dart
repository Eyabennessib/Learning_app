import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A4InCorrectScreen extends StatefulWidget{
  const A4InCorrectScreen({super.key});

  @override
  State<A4InCorrectScreen> createState()=> _A4InCorrectScreen();
}

class _A4InCorrectScreen extends State<A4InCorrectScreen>{

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
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 100.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Cannot Clear Path!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "The stones are too heavy lets continue our exploration, maybe we could find something if we stay on the main path.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/forest-path.png',
                    width: 250,
                    height: 250,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(

                    onPressed: () {
                      goToA5Intro(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      elevation: 5,
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child:  Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800
                      ),
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