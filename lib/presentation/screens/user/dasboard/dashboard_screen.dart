import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:dummy_app/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/core/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState()=> _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {

  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display an image from assets

            // Title Text
            Text(
              'Welcome to Nmimes!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),

            // Subtitle Text
            Text(
              'This is a simple home screen layout in Flutter.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}
