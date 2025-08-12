import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:flutter/material.dart';

class NavigationBarDrawer extends StatelessWidget {
  const NavigationBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();

    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top * 1.5,
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(color: AppColors.mainColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 52,
                //   backgroundImage: AssetImage("assets/mascot.png"),
                //
                // ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 4, // Border width
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.mascot),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),

                Text(
                  "Yeya",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),

          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home_outlined),
                    onTap: () => goToHome(context),
                  ),

                  ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person_2_outlined),
                    onTap: () => goToProfile(context),
                  ),

                  ListTile(
                    title: Text("Dashboard"),
                    leading: Icon(Icons.dashboard_customize_outlined),
                    onTap: () => goToDashboard(context),
                  ),

                  ListTile(
                    title: Text("Sign Out"),
                    leading: Icon(Icons.logout_outlined),
                    onTap: () {
                      _auth.signout();
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Signed Out')));
                      goToEmailLogin(context);
                    },
                  ),

                  ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.info_outlined),
                    onTap: () => goToHome(context),
                  ),

                  ListTile(
                    title: Text("Support"),
                    leading: Icon(Icons.support_agent_outlined),
                    onTap: () => goToHome(context),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text("version 0.0"),
          ),
        ],
      ),
    );
  }
}
