import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginOptionScreen extends StatelessWidget{
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                "Choose an Option",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainTextColor,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Transform.translate(
                    offset: Offset(0, 25),
                    child: GestureDetector(
                      onTap: (){
                        goToEmailLogin(context);
                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.emailOption,
                            height: 170,
                            width: 170,
                          ),

                          Positioned(
                            top: 30,
                            right: 110,
                            child: Icon(
                              Icons.mail,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Image.asset(
                    AppAssets.mascotTransparent,
                    width: 70,  // 80% of screen width
                    height: 70,
                  ),

                  Transform.translate(
                    offset: Offset(0, -25),
                    child: GestureDetector(
                      onTap: (){
                        goToOtpLogin(context);
                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.phoneOption,
                            height: 170,
                            width: 170,
                          ),

                          Positioned(
                            top: 95,
                            right: 20,
                            child: Icon(
                              Icons.local_phone,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              transformAlignment: Alignment.center,
              // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.only(top: 60.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers children horizontally
                crossAxisAlignment: CrossAxisAlignment.center, // Centers children vertically
                children: [
                  Text(
                    "Already have an account ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      goToRegisterOption(context);
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}
