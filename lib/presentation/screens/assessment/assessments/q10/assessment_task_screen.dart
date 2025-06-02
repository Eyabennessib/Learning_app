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

class A10TaskScreen extends StatefulWidget{
  const A10TaskScreen({super.key});


  @override
  State<A10TaskScreen> createState()=> _A10TaskScreen();
}

class _A10TaskScreen extends State<A10TaskScreen>{
  bool? check = false;
  final _localStorage = LocalStorage();
  String? userId = "";
  dynamic response;
  String history = "";
  bool isLoading = true;
  bool btnVisible = false;
  bool buildError = false;

  dynamic Q = {
    "QN": 10,
    "DifficultyLevel" : "Hard",
    "topic" : "Probability",
    "question" : "there are 3 items on the boat, 5 gold coins bags, 3 rare fruits and 1 treasure map. What is the probability of food."
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
      final result = await api.generateQuestion("{'question':${Q['question']}, 'topic': ${Q['topic']} }", fa);
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
                  margin: const EdgeInsets.only(top: 100.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Solve the following to row the boat.",
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
                        questionIndex: 1,
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

                    onPressed: () {

                      goToA10Correct(context);

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
                      "Row the boat!",
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