import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

void saveAnswerToFirestore({
  required String topic,
  required String question,
  required dynamic selectedOption,
  required dynamic correctOption,
  required int questionIndex,
}) async {
  final user = FirebaseAuth.instance.currentUser;
  final now = DateTime.now();
  final formatted = DateFormat('yyyy-MM-dd HH:mm').format(now);

  if (user == null) return;

  final data = {
    'topic': topic,
    'question': question,
    'selectedOption': selectedOption,
    'correctOption': correctOption,
    'timestamp': formatted,
  };

  await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('assessment')
      .doc('q$questionIndex')
      .set(data);
}

Future<String> getUserAssessmentQuestions(String userId) async {
  final assessmentSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('assessment')
      .get();

  final data = {
    for (var doc in assessmentSnapshot.docs)
      doc.id: doc.data() // e.g., "q0": {question: ..., answer: ...}
  };

  return jsonEncode(data);
}

String formatAssessmentData(Map<String, dynamic> assessmentJson) {
  String formatted = "";
  int questionNumber = 1;

  // Sort keys like q0, q1, ... to ensure proper order
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

