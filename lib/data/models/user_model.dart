import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  final String? name;
  final int? age;
  final int? progress;
  final String? language;
  final String? achievements;
  final String? grade;
  final String? avatar;
  final int? coins;
  final int? level;


  UserProfileModel({
    this.name,
    this.age,
    this.grade,
    this.progress,
    this.language,
    this.achievements,
    this.avatar,
    this.coins,
    this.level
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name ?? "",
      'age': age ?? 13,
      'grade': grade ?? "",
      'progress': progress ?? 0,
      'language': language ?? "en",
      'achievements': achievements ?? "",
      'avatar': avatar ?? "",
      'coins': coins ?? 0,
      'level': level ?? 0,
    };
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      age: json['age'],
      grade: json['grade'],
      progress: json['progress'],
      language: json['language'],
      achievements: json['achievements'],
      avatar: json['avatar'],
      coins: json['coins'],
      level: json['level']
    );
  }


  UserProfileModel copyWith({
    String? name,
    int? age,
    int? progress,
    String? language,
    String? achievements,
    String? grade,
    String? avatar,
    int? coins,
    int? level
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      age: age ?? this.age,
      progress: progress ?? this.progress,
      language: language ?? this.language,
      achievements: achievements ?? this.achievements,
      grade: grade ?? this.grade,
      avatar: avatar ?? this.avatar,
      coins: coins ?? this.coins,
      level: level ?? this.level
    );
  }

}
