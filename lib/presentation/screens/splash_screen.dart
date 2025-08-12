import 'package:dummy_app/presentation/screens/auth/options/register_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'auth/email/email_login_screen.dart';
import 'auth/email/email_register_screen.dart';
import 'package:dummy_app/core/constants.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState()=> _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_)=> RegisterOptionScreen(),
        )
      );
    });
  }
  
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  AppAssets.mascotTransparent,
                  width: MediaQuery.of(context).size.width * 0.7,  // 80% of screen width
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ],
          )
      ),
    );
  }
}