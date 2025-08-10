import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/collections/assessment.dart';
import 'package:dummy_app/presentation/widgets/mcq/mcq_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes.dart';

class A1TaskScreen extends StatefulWidget{
  const A1TaskScreen({super.key});

  @override
  State<A1TaskScreen> createState()=> _A1TaskScreen();
}

class _A1TaskScreen extends State<A1TaskScreen>{

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
                    "Ah! Mathematics.",
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
                  child: MCQWidget(
                    question: "How do you feel about mathematics?",
                    options: ["Great", "OK", "Difficult"],
                    onOptionSelected: (selected) {
                      saveAnswerToFirestore(
                        topic: 'Emotional check-In',
                        question: "How do you feel about mathematics?",
                        selectedOption: selected,
                        correctOption: "",
                        questionIndex: 1, // index of the current question
                      );
                    },
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      goToA2Intro(context);
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
                      "Next",
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