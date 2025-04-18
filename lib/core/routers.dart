import 'package:dummy_app/presentation/screens/assessment/assessment_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/start_assesment.dart';
import 'package:dummy_app/presentation/screens/auth/email/email_login_screen.dart';
import 'package:dummy_app/presentation/screens/auth/email/email_register_screen.dart';
import 'package:dummy_app/presentation/screens/home_screen.dart';
import 'package:dummy_app/presentation/screens/auth/options/login_option_screen.dart';
import 'package:dummy_app/presentation/screens/auth/phone/otp_screen.dart';
import 'package:dummy_app/presentation/screens/auth/phone/phone_login_screen.dart';
import 'package:dummy_app/presentation/screens/auth/phone/phone_register_screen.dart';
import 'package:dummy_app/presentation/screens/auth/options/register_option_screen.dart';
import 'package:dummy_app/presentation/screens/intro/intro_screen.dart';
import 'package:dummy_app/presentation/screens/lesson/lessons/maths/math_lesson_selection_screen.dart';
import 'package:dummy_app/presentation/screens/user/dasboard/dashboard_screen.dart';
import 'package:dummy_app/presentation/screens/user/profile/fill_profile_screen.dart';
import 'package:dummy_app/presentation/screens/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';


void goToHome(BuildContext context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);

void goToEmailLogin(context) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => EmailLoginScreen()),
);

void goToOtpLogin(context) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => OtpLoginScreen()),
);

void goToPhoneRegister(context) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PhoneRegisterScreen()),
);

void goToOtp(context, verificationId) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,)),
);

void goToEmailRegister(context) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => EmailRegisterScreen()),
);

void goToRegisterOption(context) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => RegisterOptionScreen()),
);

void goToLoginOption(context) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => LoginOptionScreen()),
);

void goToFillProfile(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => FillProfileScreen()),
);

void goToProfile(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);

void goToIntro(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => IntroScreen()),
);

void goToAssessment(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AssessmentScreen()),
);

void goToDashboard(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DashboardScreen()),
);

void goToMathLessons(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MathLessonsScreen()),
);

void goToSubjects(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MathLessonsScreen()),
);

void goToStartAssesment(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => StartAssesmentScreen()),
);
