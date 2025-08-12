import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/local-storage/opened-page/local_storage.dart';
import 'package:dummy_app/core/constants.dart';
import 'package:dummy_app/presentation/screens/assessment/analyze_assessment.dart';
import 'package:dummy_app/presentation/screens/assessment/assessments/q2/assessment_task_screen.dart';
import 'package:dummy_app/presentation/screens/assessment/start_assesment.dart';
import 'package:dummy_app/presentation/screens/home_screen.dart';
import 'package:dummy_app/presentation/screens/auth/options/login_option_screen.dart';
import 'package:dummy_app/presentation/screens/user/profile/fill_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/auth/email/email_register_screen.dart';
import 'presentation/screens/auth/email/email_login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'presentation/screens/auth/options/register_option_screen.dart';

class MyApp extends StatefulWidget{
  const MyApp({super.key});


  @override
  State<MyApp> createState()=> _MyApp();

  static void setLocale(BuildContext context, Locale newLocale){
    _MyApp? state = context.findRootAncestorStateOfType<_MyApp>();
    state?.setLocale(newLocale);
  }
}

class _MyApp extends State<MyApp>{
  Locale? _locale;
  setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  String _initialRoute = AppRoutes.loading;

  Future<void> _loadInitialRoute() async {
    final lastRoute = await getCurrentRoute() ?? AppRoutes.home;

    if (!mounted) return; // prevent calling setState after dispose
    setState(() {
      _initialRoute = lastRoute;
    });
  }


  @override
  Widget build(BuildContext context){


    return MaterialApp(

      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates:  AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: Scaffold(
        body: AuthCheck() // AnalyzeAssessmentScreen() //    // StartAssesmentScreen()   AssessmentScreen()
      ),

    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading while checking
        } else if (snapshot.hasData) {
          return HomeScreen(); // User is logged in
        } else {
          return LoginOptionScreen(); // User is NOT logged in
        }
      },
    );
  }
}
