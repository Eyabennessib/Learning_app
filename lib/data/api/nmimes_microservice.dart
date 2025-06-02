import 'dart:convert';
import 'package:http/http.dart' as http;


class ChatResponse {
  final String question;
  final dynamic options;
  final dynamic correctOption;

  ChatResponse({
    required this.question,
    required this.options,
    required this.correctOption,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      question: json['question'],
      options: List<String>.from(json['options'].map((e) => e.toString())),
      correctOption: json['correctOption'],
    );
  }
}




class TaskItem {
  final bool done;
  final String task;

  TaskItem({required this.done, required this.task});

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      done: json['done'],
      task: json['task'],
    );
  }
}

class Week {
  final String week;
  final List<TaskItem> tasks;

  Week({required this.week, required this.tasks});

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      week: json['week'],
      tasks: List<TaskItem>.from(json['tasks'].map((e) => TaskItem.fromJson(e))),
    );
  }
}

class AnalyseResponse {
  final String level;
  final List<Week> task;
  final String strength;
  final String weakness;

  AnalyseResponse({
    required this.level,
    required this.task,
    required this.strength,
    required this.weakness,
  });

  factory AnalyseResponse.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    return AnalyseResponse(
      level: json['level'],
      task: List<Week>.from(json['task'].map((e) => Week.fromJson(e))),
      strength: json['strength'],
      weakness: json['weakness'],
    );
  }
}


class ApiService {
  final String baseUrl = 'http://192.168.1.7:8001/';

  Future<ChatResponse> generateQuestion(String question, String history) async {
    final response = await http.post(
      Uri.parse('${baseUrl}chat/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'prompt': question, 'history': history}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);
      return ChatResponse.fromJson(data['response']);
    } else {
      throw Exception('Failed to fetch question: ${response.body}');
    }
  }

  Future<AnalyseResponse> analyzeAssessment(String history) async {
    final response = await http.post(
      Uri.parse('${baseUrl}analyze/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'history': history}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);
      return AnalyseResponse.fromJson(data['response']);
    } else {
      throw Exception('Failed to fetch question: ${response.body}');
    }
  }
}
