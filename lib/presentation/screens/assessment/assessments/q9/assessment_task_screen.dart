import 'dart:convert';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/collections/assessment.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';
import 'package:dummy_app/data/api/nmimes_microservice.dart';
import 'package:dummy_app/presentation/widgets/loaders/assessment-loader/assessment_loader.dart';
import 'package:dummy_app/presentation/widgets/mcq/mcq_widget.dart';
import 'package:dummy_app/presentation/widgets/messages/errors/error.dart';
import 'package:flutter/material.dart';

import 'package:dummy_app/core/themes.dart';

class A9TaskScreen extends StatefulWidget{
  const A9TaskScreen({super.key});


  @override
  State<A9TaskScreen> createState()=> _A9TaskScreen();
}

class _A9TaskScreen extends State<A9TaskScreen>{
  bool? check = false;
  final _localStorage = LocalStorage();
  String? userId = "";
  dynamic response;
  String history = "";
  bool isLoading = true;
  bool btnVisible = false;
  bool buildError = false;

  dynamic Q = {
    "QN": 9,
    "DifficultyLevel" : "Hard",
    "topic":"Logical reasoning",
    "question" : "An ancient with a side length of 8 meters has a square fountain in the center with a side length of 2 meters. What is the area available for planting around the fountain?"
  };

  final ApiService api = ApiService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  Future<void> loadData() async {
    try {
      final uId = await _localStorage.getUserId(); // get user ID first
      final userAssessment = await getUserAssessmentQuestions(uId!);
      final decodedAssessment = jsonDecode(userAssessment) as Map<String, dynamic>;
      final fa = formatAssessmentData(decodedAssessment);
      final result = await api.generateQuestion("{'question': '${Q['question']}', 'topic': '${Q['topic']}' }", fa);
      setState(() {
        response = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        response = 'Error: $e';
        isLoading = false;
        buildError = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: isLoading? Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.9,
              // decoration: BoxDecoration(
              //   border: Border.all(width: 2.0)
              // ),
              child: AssessmentLoader(),
            ) : buildError? AssessmentErrorWidget() : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  margin: const EdgeInsets.only(top: 30.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Solve the following to open temple gates.",
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
                  margin: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.center,
                  child: MCQWidget(
                    question: response?.question,
                    options: response?.options,
                    onOptionSelected: (selected) {

                      setState(() {
                        btnVisible = true;
                      });

                      saveAnswerToFirestore(
                        topic: Q['topic'],
                        question: response?.question,
                        selectedOption: selected,
                        correctOption: response?.correctOption,
                        questionIndex: Q['QN'],
                      );


                      if(selected.toString() == response?.correctOption.toString()){
                        setState(() {
                          check = true;
                        });
                      }


                    },
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: btnVisible? ElevatedButton(

                    onPressed: () async {
                      if(check == false){
                        goToA9InCorrect(context);
                      }

                      else{
                        goToA9Correct(context);
                      }

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
                      "Open!",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ) : SizedBox.shrink(),
                ),
              ],
            ),
          )
      ),
    );
  }
}