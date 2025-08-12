import 'package:dummy_app/app.dart';
import 'package:dummy_app/presentation/screens/auth/options/login_option_screen.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Sets up the Firebase Auth and Core method channel mocks so that
/// [Firebase.initializeApp] and [FirebaseAuth] can be used in tests without
/// real platform channels.
void setupFirebaseAuthMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.initializeApp = (String? app, Map<String, dynamic>? options) async {
    return {'name': app ?? '[DEFAULT]', 'options': options ?? <String, dynamic>{}};
  };

  MethodChannelFirebaseAuth.channel.setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Auth#registerAuthStateListener' ||
        call.method == 'Auth#registerIdTokenListener') {
      return <String, dynamic>{};
    }
    return null;
  });
}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('shows loader then login screen when user is not authenticated',
      (WidgetTester tester) async {
    // Build our app and trigger the first frame where the auth state is still
    // being checked.
    await tester.pumpWidget(const MyApp());

    // Expect a loading spinner while waiting for auth state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Let the auth state stream emit its first value (no user signed in).
    await tester.pump();

    // The login screen should be displayed for an unauthenticated user.
    expect(find.byType(LoginOptionScreen), findsOneWidget);
  });
}

