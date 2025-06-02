import 'package:dummy_app/core/themes.dart';
import 'package:flutter/material.dart';


class AssessmentErrorWidget extends StatelessWidget {
  const AssessmentErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/error.png', // replace with your asset path
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),

          Center(
            child: Text("ERROR",
              textAlign: TextAlign.center,
              style: TextStyle(

                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 30
              ),
            ),
          ),

          Center(

            child: Text("Please check your internet connection or try again, if the issue persist contact support!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            margin: const EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [


                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          elevation: 5,

                          backgroundColor: AppColors.mainColor,
                          shape: CircleBorder()
                      ),

                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 60,
                      ),

                    ),
                    Text("Back",
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontWeight: FontWeight.w700
                    ),
                    )
                  ],
                ),


                SizedBox(width: 100),


                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          elevation: 5,

                          backgroundColor: AppColors.mainColor,
                          shape: CircleBorder()
                      ),

                      child: Icon(
                        Icons.support_agent_outlined,
                        color: Colors.white,
                        size: 60,
                      ),

                    ),
                    Text("Support",
                      style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                )


              ],
            ),
          ),

        ],
      ),
    );
  }
}
