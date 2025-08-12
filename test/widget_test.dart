import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:dummy_app/app.dart';
import 'package:dummy_app/presentation/screens/auth/options/login_option_screen.dart';
import 'package:dummy_app/presentation/screens/home_screen.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('shows loader then login when signed out', (WidgetTester tester) async {
    final auth = FirebaseAuth.instance as MockFirebaseAuth;
    await auth.signOut();

    await tester.pumpWidget(const MyApp());

    // Should show loading spinner while auth state is checked.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // After auth check completes, the login screen should appear.
    await tester.pump();
    expect(find.byType(LoginOptionScreen), findsOneWidget);
  });

  testWidgets('shows loader then home when signed in', (WidgetTester tester) async {
    final auth = FirebaseAuth.instance as MockFirebaseAuth;
    await auth.signInAnonymously();

    await tester.pumpWidget(const MyApp());

    // Should show loading spinner while auth state is checked.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // After auth check completes, the home screen should appear.
    await tester.pump();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
