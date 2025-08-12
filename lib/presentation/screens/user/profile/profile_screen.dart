import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:dummy_app/core/services/collections/user_profile.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/data/models/user_model.dart';
import 'package:dummy_app/presentation/widgets/navigation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});
  
  @override
  State<ProfileScreen> createState()=> _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{
  final _store = UserProfile();
  final _localStorage = LocalStorage();
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();
  final userVerification = AuthService().getUserVerification();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  // User? userAuth = FirebaseAuth.instance.currentUser;
  String? userId;

  Future<UserProfileModel?> getUserProfile() async {
    userId = await _localStorage.getUserId();
    if (userId != null) {
      return _store.getUser(userId);
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: const EdgeInsets.all(0.0),
          child: FutureBuilder<UserProfileModel?>(
              future: getUserProfile(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error fetching data'));
                }

                if(snapshot.hasData){
                  nameController.text = snapshot.data?.name ?? "";
                }

                UserProfileModel? user = snapshot.data;

                return user != null? SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 80.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.mainColor, // Border color
                              width: 4, // Border width
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.mascot),
                              fit: BoxFit.contain, // Adjust the fit as needed
                            ),
                          ),
                        ),
                      ),


                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: Text(
                          user.name ?? "Guest",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: AppColors.mainColor,),

                            Text(
                              user.coins.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        )
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: userVerification['fore'],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          userVerification['text'],
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: userVerification['back'],
                          ),
                        ),
                      ),

                      Divider(thickness: 2,),

                      Container(
                        // width: MediaQuery.of(context).size.width * 0.6,
                        // padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   color: AppColors.mainColor,
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1.2,
                          maxProgress: 100,
                          progress: 50,
                          animation: true,
                          foregroundColor: AppColors.mainColor,
                          foregroundStrokeWidth: 15,
                          backgroundStrokeWidth: 15,
                          backgroundColor: Colors.white30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("50%",
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45
                                ),
                              ),

                              Text("Progress",
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                                ),
                              )

                            ],
                          ),
                        ),
                      ),

                      Container(
                        // width: MediaQuery.of(context).size.width * 0.6,
                        // padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   color: AppColors.mainColor,
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: DashedCircularProgressBar.aspectRatio(
                          aspectRatio: 1.2,
                          maxProgress: 100,
                          progress: 10,
                          animation: true,
                          foregroundColor: AppColors.mainColor,
                          foregroundStrokeWidth: 15,
                          backgroundStrokeWidth: 15,
                          backgroundColor: Colors.white30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("10%",
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45
                                ),
                              ),

                              Text("Achievements",
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),
                              )

                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 70.0),
                        child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  cursorColor: AppColors.mainColor,
                                  // validator: _validateEmail,
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "John",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    labelStyle: TextStyle(
                                        color: Colors.grey
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey
                                      ), // Default border color
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.mainColor,
                                          width: 2.0
                                      ), // Custom focus color
                                    ),

                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red), // Border on error
                                    ),

                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 2), // Border on error when focused
                                    ),


                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    onPressed: () async {


                                    },

                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                      backgroundColor: AppColors.mainColor,
                                    ),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                        )
                      ),



                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _auth.signout();
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text('Signed Out')));
                            goToEmailLogin(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            backgroundColor: AppColors.mainColor,
                          ),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                    ],
                  ),
                ) : Center(child: Text('User Not Found'));
              },
          ),
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}