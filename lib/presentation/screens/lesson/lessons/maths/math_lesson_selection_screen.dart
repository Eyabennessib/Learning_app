import 'package:dummy_app/core/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';

class MathLessonsScreen extends StatelessWidget {
  const MathLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar( ),
      body: SingleChildScrollView(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lessons',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text("Basic Math"),
                      leading: Icon(Icons.book_outlined),
                      onTap: (){

                      },
                    ),

                    ListTile(
                      title: Text("Trigonometry"),
                      leading: Icon(Icons.book_outlined),
                      onTap: () {

                      },
                    ),

                    ListTile(
                      title: Text("Calculus"),
                      leading: Icon(Icons.book_outlined),
                      onTap: () {

                      },
                    ),

                    ListTile(
                      title: Text("Geometry"),
                      leading: Icon(Icons.book_outlined),
                      onTap: () {

                      },
                    ),

                    ListTile(
                      title: Text("Probability"),
                      leading: Icon(Icons.book_outlined),
                      onTap: () {

                      },
                    ),

                    ListTile(
                      title: Text("Statistics"),
                      leading: Icon(Icons.book_outlined),
                      onTap: () => goToHome(context),
                    ),
                  ],
                ),
              ],
            )


          ),
        ),
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}
