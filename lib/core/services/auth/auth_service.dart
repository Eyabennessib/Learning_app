import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // String _extractErrorCode(String errorMessage) {
  //   RegExp regex = RegExp(r'\[firebase_auth/([^\]]+)\]');
  //   Match? match = regex.firstMatch(errorMessage);
  //   return match != null ? match.group(1)! : "unknown";
  // }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
        case 'invalid-email':
        return 'Invalid email format!';

        case 'invalid-credential':
        return 'Invalid password or email!';

        case 'user-not-found':
        return 'No user found with this email!';

        case 'wrong-password':
        return 'Incorrect password, please try again!';

        case 'user-disabled':
        return 'This account has been disabled!';

        case 'too-many-requests':
        return 'Too many attempts. Try again later!';

        case 'email-already-in-use':
        return 'Email already  in use! Try another.';

        default:
        return 'An unexpected error occurred! Please try again.';
    }
  }

  Future<dynamic> createUserEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return [userCredential.user!.uid, "Successfully Signed Up!"];
    } on FirebaseAuthException catch (e) {
      log("USER REGISTRATION ERROR: ${e.code}");
      // String error = _extractErrorCode(e.code);
      return [null, _getErrorMessage(e.code)];
    }
  }

  Future<dynamic> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return [cred.user!.uid, "Successfully Signed In!"];
    } on FirebaseAuthException catch (e) {

      log("USER LOGIN ERROR: ${e.code}");
      // String error = _extractErrorCode(e.code);
      return [null, _getErrorMessage(e.code)];
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("USER LOGOUT ERROR: $e");
    }
  }

  Future<bool?> updateUserPassword(String newPassword, String oldPassword) async {
    final user = _auth.currentUser;

    if (user != null) {
      // Re-authenticate the user
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword, // User's current password
      );

      try{
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
        return true;
      }catch(e){
        log(e.toString());
        return false;
      }
    }

    return null;

  }

  Map<String, dynamic > getUserVerification() {
    final user = _auth.currentUser;

    if(user!.emailVerified){
      return {"fore": Colors.white, "back": Colors.greenAccent, "text": "Email Verified", "value": user.emailVerified};
    }
    return {"fore": Colors.white, "back": Colors.redAccent, "text": "Email Not Verified!", "value": user.emailVerified};

  }
}
