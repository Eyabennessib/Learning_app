import 'dart:convert';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/collections/analysis.dart';
import 'package:dummy_app/core/services/collections/assessment.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';
import 'package:dummy_app/data/api/nmimes_microservice.dart';
import 'package:dummy_app/presentation/widgets/loaders/assessment-loader/assessment_loader.dart';
import 'package:dummy_app/presentation/widgets/messages/errors/error.dart';
import 'package:dummy_app/presentation/widgets/navigation/bottom/navigation.dart';
import 'package:dummy_app/presentation/widgets/tasks/task.dart';
import 'package:flutter/material.dart';

import 'package:dummy_app/core/themes.dart';

class AnalyzeAssessmentScreen extends StatefulWidget{
  const AnalyzeAssessmentScreen({super.key});


  @override
  State<AnalyzeAssessmentScreen> createState()=> _AnalyzeAssessmentScreen();
}

class _AnalyzeAssessmentScreen extends State<AnalyzeAssessmentScreen>{
  bool? check = false;
  final _localStorage = LocalStorage();
  String? userId = "";
  dynamic response;
  String history = "";
  bool isLoading = true;
  bool btnVisible = false;
  bool buildError = false;

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
      final uId = await _localStorage.getUserId();
      print("USER ID: " + uId.toString());
      final userAssessment = await getUserAssessmentQuestions(uId!);
      final decodedAssessment = jsonDecode(userAssessment) as Map<String, dynamic>;
      final fa = formatAssessmentData(decodedAssessment);
      print("HISTORY: \n" + fa);
      final result = await api.analyzeAssessment("{'history': '$fa' }");
      setState(() {
        response = result;
        isLoading = false;
      });
    } catch (e) {
      print("ERROR: " + e.toString());
      setState(() {
        response = 'Error: $e';
        isLoading = false;
        buildError = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Map<String, dynamic>> weeks = [
      {
        'week': 'Week 1',
        'tasks': [
          {'done': true, 'task': 'Review basic arithmetic operations (addition, subtraction, multiplication, division).'},
          {'done': false,'task': 'Fractions & Decimals'}
        ],
        'done': true
      },
      {
        'week': 'Week 2',
        'tasks': [
          {'done': true, 'task': 'Percentages & Ratios'},
          {'done': false,'task': 'Task B'}
        ],
        'done': false
      },
      {
        'week': 'Week 3',
        'tasks': [
          {'done': true, 'task': 'Task A'},
          {'done': false,'task': 'Task B'}
        ],
        'done': false
      },
      {
        'week': 'Week 4',
        'tasks': [
          {'done': true, 'task': 'Task A'},
          {'done': false,'task': 'Task B'}
        ],
        'done': false
      },
      {
        'week': 'Week 5',
        'tasks': [
          {'done': true, 'task': 'Task A'},
          {'done': false,'task': 'Task B'}
        ],
        'done': false
      },
      {
        'week': 'Week 6',
        'tasks': [
          {'done': true, 'task': 'Task A'},
          {'done': false,'task': 'Task B'}
        ],
        'done': false
      },
    ];

    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigator( currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                //   margin: const EdgeInsets.only(top: 70.0),
                //   alignment: Alignment.center,
                //   child: Image.asset("assets/icons/map.png"),
                // ),


                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
                  margin: const EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.mainTextColor, // Set your desired color
                        width: 1.0,         // Set your desired width
                      ),
                    )
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Roadmap",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
                  margin: const EdgeInsets.only(top: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Level up your skills with our smart plan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

               WeeklyTaskList(weeks: response?.task),


                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                //   margin: const EdgeInsets.only(top: 20.0),
                //   alignment: Alignment.center,
                //   child: MCQWidget(
                //     question: ,
                //     options: response?.options,
                //     onOptionSelected: (selected) {
                //
                //       setState(() {
                //         btnVisible = true;
                //       });
                //
                //       saveAnalysisToFirestore(tasks: response?.task, strength: response?.strength, weakness: response?.weakness);
                //
                //       // if(selected.toString() == response?.correctOption.toString()){
                //       //   setState(() {
                //       //     check = true;
                //       //   });
                //       // }
                //
                //
                //     },
                //   ),
                // ),

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