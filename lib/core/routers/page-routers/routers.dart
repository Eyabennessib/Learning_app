import 'package:dummy_app/presentation/screens/assessment/assessments/q1/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q10/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q10/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q10/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q2/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q2/assessment_incorrect_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q2/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q1/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q2/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q3/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q3/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q3/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q4/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q4/assessment_incorrect_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q4/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q4/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q5/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q5/assessment_intro2_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q5/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q5/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q6/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q6/assessment_intro2_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q6/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q6/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q7/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q7/assessment_incorrect_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q7/assessment_intro2_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q7/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q7/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q8/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q8/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q8/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q9/assessment_correct_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q9/assessment_incorrect_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q9/assessment_intro_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q9/assessment_task_screen.dart';

import 'package:dummy_app/presentation/screens/assessment/start_assesment.dart';
import 'package:dummy_app/presentation/screens/auth/email/email_login_screen.dart';
import 'package:dummy_app/presentation/screens/auth/email/email_register_screen.dart';
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
import 'package:dummy_app/core/constants.dart';


void goToHome(BuildContext context) =>
    Navigator.pushReplacementNamed(context, AppRoutes.home);

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


// Assessments Navigation
void goToStartAssessment(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => StartAssesmentScreen()),
);

// A1
void goToA1Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A1IntroScreen()),
);

void goToA1Task(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A1TaskScreen()),
);

// A2
void goToA2Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A2IntroScreen()),
);

void goToA2Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A2TaskScreen()),
);

void goToA2Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A2CorrectScreen()),
);

void goToA2InCorrect(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A2InCorrectScreen()),
);


// A3
void goToA3Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A3IntroScreen()),
);

void goToA3Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A3TaskScreen()),
);

void goToA3Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A3CorrectScreen()),
);

// A4
void goToA4Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A4IntroScreen()),
);

void goToA4Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A4TaskScreen()),
);

void goToA4Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A4CorrectScreen()),
);

void goToA4InCorrect(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A4InCorrectScreen()),
);



// A5
void goToA5Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A5IntroScreen()),
);

void goToA5Intro2(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A5IntroScreen2()),
);

void goToA5Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A5TaskScreen()),
);

void goToA5Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A5CorrectScreen()),
);

// A6
void goToA6Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A6IntroScreen()),
);

void goToA6Intro2(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A6IntroScreen2()),
);

void goToA6Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A6TaskScreen()),
);

void goToA6Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A6CorrectScreen()),
);

// A7
void goToA7Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A7IntroScreen()),
);


void goToA7Intro2(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A7IntroScreen2()),
);

void goToA7Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A7TaskScreen()),
);

void goToA7Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A7CorrectScreen()),
);

void goToA7InCorrect(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A7InCorrectScreen()),
);

// A8
void goToA8Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A8IntroScreen()),
);

void goToA8Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A8TaskScreen()),
);

void goToA8Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A8CorrectScreen()),
);


// A9
void goToA9Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A9IntroScreen()),
);

void goToA9Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A9TaskScreen()),
);

void goToA9Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A9CorrectScreen()),
);


void goToA9InCorrect(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A9InCorrectScreen()),
);

// A10
void goToA10Intro(context)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => A10IntroScreen()),
);

void goToA10Task(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A10TaskScreen()),
);

void goToA10Correct(context)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => A10CorrectScreen()),
);
