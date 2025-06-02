import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A10IntroScreen extends StatefulWidget{
  const A10IntroScreen({super.key});

  @override
  State<A10IntroScreen> createState()=> _A10IntroScreen();
}

class _A10IntroScreen extends State<A10IntroScreen>{

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
                    "A Boat!",
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
                    "Oh look! a boat. lets get out of here. we collected enough gold coins and food. Now its time to leave.",
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
                  margin: const EdgeInsets.only(top: 50.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/boat.png',
                    width: 200,
                    height: 200,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      goToA10Task(context);
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
                      "Leave Island!",
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