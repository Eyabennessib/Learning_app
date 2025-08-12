import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';
import 'package:confetti/confetti.dart';

class A10CorrectScreen extends StatefulWidget{
  const A10CorrectScreen({super.key});

  @override
  State<A10CorrectScreen> createState()=> _A10CorrectScreen();
}

class _A10CorrectScreen extends State<A10CorrectScreen>{

  late ConfettiController _controllerConfettiTop;

  @override
  void initState() {
    super.initState();
    _controllerConfettiTop = ConfettiController(duration: const Duration(seconds: 2));
    _controllerConfettiTop.play();
  }

  @override
  void dispose() {
    _controllerConfettiTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerConfettiTop,
                    blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
                    shouldLoop: false, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    // createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Great Work!",
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
                        "Great work adventurer, Lets see your abilities on the next page.",
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
                        AppAssets.mascotTransparent,
                        width: 250,
                        height: 250,
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(

                        onPressed: () {
                          goToA10Intro(context);
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
                          "Analyze",
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
              ],
            )
          )
      ),
    );
  }
}