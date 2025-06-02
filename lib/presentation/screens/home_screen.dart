import 'package:dummy_app/presentation/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display an image from assets

              // Title Text
              Text(
                'Subjects',
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

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                alignment: Alignment.topCenter,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black,
                //     width: 4
                //   )
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text("Mathematics"),
                        leading: Icon(Icons.book_outlined),
                        onTap: () => goToMathLessons(context),
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
                )
              )

            ],
          ),
        )
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}
