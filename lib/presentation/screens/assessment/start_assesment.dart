import 'dart:developer';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class EmailLoginScreen extends StatefulWidget{
//   const EmailLoginScreen({super.key});
//
//   @override
//   State<EmailLoginScreen> createState()=> _EmailLoginScreen();
//
// }

class StartAssesmentScreen extends StatelessWidget {
  const StartAssesmentScreen({super.key});
  // final _auth = AuthService();
  // final _localStorage = LocalStorage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(
                  -MediaQuery.of(context).size.width * 0.35,
                  MediaQuery.of(context).size.height * 0.01,
                ),
                child: GestureDetector(
                  onTap: () => goToFillProfile(context),
                  child: Image.asset(
                    AppAssets.backButton,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                margin: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                child: SvgPicture.asset(AppAssets.letsStartMessage,),

              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                child: Text(
                  "Hey adventurer before we start our journey, lets test your knowledge!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
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
                  width: 150,
                  height: 150,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(

                  onPressed: () async {
                    goToA1Intro(context);
                    // _formKey.currentState!.validate();

                    // MyApp.setLocale(context, Locale('fr'));
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
                    "I'm ready",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),

              // Button

            ],
          ),
        ),
      ),
    );
  }
}
