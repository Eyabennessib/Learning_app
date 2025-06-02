import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A6IntroScreen2 extends StatefulWidget{
  const A6IntroScreen2({super.key});

  @override
  State<A6IntroScreen2> createState()=> _A6IntroScreen2();
}

class _A6IntroScreen2 extends State<A6IntroScreen2>{

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
                    "Cool a Map!",
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
                    "wow its actually a map that  leads to some more treasure. Lets find out!",
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
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/map.png',
                    width: 250,
                    height: 250,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(

                    onPressed: () {
                      goToA6Task(context);
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
                      "Let Goo!",
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