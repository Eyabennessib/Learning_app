import 'dart:developer';
import 'package:dummy_app/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserProfile {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> createUserProfile(String userId, UserProfileModel user) async {
    try{
      _store.collection("users").doc(userId).set(user.toJson());
    }catch(e){
      log(e.toString());
    }
  }

  Future<void> updateUserProfile(String userId, UserProfileModel user) async {
    try{
      _store.collection("users").doc(userId).update(user.toJson());
    }catch(e){
      log(e.toString());
    }
  }

  Future<UserProfileModel?> getUser(String? userId) async {
    try{
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (doc.exists) {
        return UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;

    }catch(e){
      log(e.toString());
      return null;
    }

  }


}