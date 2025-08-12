import 'package:dummy_app/core/constants.dart';
import 'package:dummy_app/core/routers/route_persistence_observer.dart';
import 'package:dummy_app/core/services/local-storage/opened-page/local_storage.dart';
import 'package:dummy_app/presentation/screens/auth/options/login_option_screen.dart';
import 'package:dummy_app/presentation/screens/home_screen.dart';
import 'package:dummy_app/presentation/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';

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
  void initState() {
    super.initState();
    _loadInitialRoute();
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
      initialRoute: _initialRoute,
      routes: {
        AppRoutes.loading: (_) => const SplashScreen(),
        AppRoutes.home: (_) => Scaffold(body: const AuthCheck()),
      },
      navigatorObservers: [RoutePersistenceObserver()],
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

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
