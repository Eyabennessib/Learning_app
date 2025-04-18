import 'package:dummy_app/core/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text("Maths"),
                  leading: Icon(Icons.book_outlined),
                  onTap: ()=> goToMathLessons(context),
                ),

                ListTile(
                  title: Text("Physics"),
                  leading: Icon(Icons.book_outlined),
                  onTap: () {
                    ScaffoldMessenger(
                      child: SnackBar(
                          content: Text("Coming soon...")
                      ),
                    );
                  },
                ),

                ListTile(
                  title: Text("Chemistry"),
                  leading: Icon(Icons.book_outlined),
                  onTap: () {
                    ScaffoldMessenger(
                      child: SnackBar(
                          content: Text("Coming soon...")
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}
