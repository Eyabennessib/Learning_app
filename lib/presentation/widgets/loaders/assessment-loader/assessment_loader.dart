import 'package:dummy_app/core/themes.dart';
import 'package:flutter/material.dart';

// class AssessmentLoader extends StatefulWidget {
//   const AssessmentLoader({
//
//     super.key,
//   });
//
//   @override
//   State<MCQWidget> createState() => _MCQWidgetState();
// }

class AssessmentLoader  extends StatelessWidget {
  const AssessmentLoader({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
              )),
        ),
        Image.asset(
          'assets/mascot/mascot-transparent.png', // replace with your asset path
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
