import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A5IntroScreen extends StatefulWidget{
  const A5IntroScreen({super.key});

  @override
  State<A5IntroScreen> createState()=> _A5IntroScreen();
}

class _A5IntroScreen extends State<A5IntroScreen>{

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
                    "A Cave!",
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
                    "That was a long walk. But finally we have come across something interesting. Lets see what this cave have to offer. Maybe we could find some treasure there!",
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
                  margin: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/cave.png',
                    width: 250,
                    height: 250,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      goToA5Intro2(context);
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
                      "Explore!",
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