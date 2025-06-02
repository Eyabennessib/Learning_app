import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A7IntroScreen extends StatefulWidget{
  const A7IntroScreen({super.key});

  @override
  State<A7IntroScreen> createState()=> _A7IntroScreen();
}

class _A7IntroScreen extends State<A7IntroScreen>{

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
                    "A Wrecked Ship!",
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
                    "A wrecked ship, lets get inside see what we can find.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                //   margin: const EdgeInsets.only(top: 20.0),
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Solve carefully: equation=?",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: AppColors.mainTextColor,
                //       fontWeight: FontWeight.w700
                //     ),
                //   ),
                // ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 50.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/ship-wreck.png',
                    width: 200,
                    height: 200,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      goToA7Intro2(context);
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
                      "Get Inside!",
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