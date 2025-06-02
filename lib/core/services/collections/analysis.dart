import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

// Future<void> saveAnalysisToFirebase(AnalyseResponse response, String userId) async {
//   final firestore = FirebaseFirestore.instance;
//
//   await firestore.collection('users').doc(userId).update({
//     'analysis': response.toJson(),
//   });
// }


Future<Map<String, dynamic>?> getUserAnalysis(String userId) async {
  final docSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .get();

  if (docSnapshot.exists) {
    final data = docSnapshot.data();
    return data?['analysis'] as Map<String, dynamic>?;
  }

  return null;
}


String formatAnalysisData(Map<String, dynamic> assessmentJson) {
  String formatted = "";
  int questionNumber = 1;

  final sortedKeys = assessmentJson.keys.toList()
    ..sort((a, b) => a.compareTo(b));

  for (var key in sortedKeys) {
    final item = assessmentJson[key];
    final topic = item['topic'] ?? '';
    final question = item['question'] ?? '';
    final userAnswer = item['selectedOption']?.toString() ?? 'N/A';
    final correctAnswer = item['correctOption']?.toString() ?? 'N/A';
    final timestamp = item['timestamp'] ?? '';

    formatted +=
    '''Question Number $questionNumber
Topic: $topic
Question: $question
User Answered: $userAnswer
Correct Answer: $correctAnswer
Time Taken: $timestamp
\n\n''';

    questionNumber++;
  }

  return formatted;
}

