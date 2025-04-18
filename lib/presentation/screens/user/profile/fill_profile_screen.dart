import 'package:dummy_app/core/routers.dart';
import 'package:dummy_app/core/services/collections/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'dart:developer';
import 'package:dummy_app/core/services/local-storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dummy_app/data/models/user_model.dart';

class FillProfileScreen extends StatefulWidget{
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState()=> _FillProfileScreen();
}

class _FillProfileScreen extends State<FillProfileScreen>{
  final _store = UserProfile();
  final _formKey = GlobalKey<FormState>();
  final _localStorage = LocalStorage();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final gradeController = TextEditingController();
  final List<String> grades = ['7', '8', '9'];
  String? selectedGrade;

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    gradeController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name!';
    }

    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age!';
    }

    int? age = int.tryParse(value);

    if (age == null) {
      return 'Enter a valid number';
    }

    log(age.toString());
    if(age <= 12 || age >= 21){
      return 'You can enter age from 13 to 20';
    }

    return null;
  }

  String? _validateGrade(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your grade!';
    }

    return null;
  }

  void _submitForm(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      int? age = int.tryParse(ageController.text);
      String? userId = await _localStorage.getUserId();
      UserProfileModel newUser = UserProfileModel(
        name:  nameController.text,
        age: age!,
        grade: selectedGrade
      );

      _store.createUserProfile(userId!, newUser);

      nameController.clear();
      ageController.clear();

      goToStartAssesment(context);

      // goToIntro(context);

    }
    //
    // if(_formKey.currentState!.validate()){
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 100.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Setup your profile",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ),

                    // START FORM
                    // Name
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        cursorColor: AppColors.mainColor,
                        style: TextStyle(color: Colors.black),
                        validator: _validateName,
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: AppColors.inputBackground,

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),

                          labelStyle: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                          ),

                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: AppColors.mainColor
                            ), // Default border color
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: AppColors.mainColor,
                                width: 2.0
                            ), // Custom focus color
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red), // Border on error
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red, width: 2), // Border on error when focused
                          ),


                        ),
                      ),
                    ),

                    // Age
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        cursorColor: AppColors.mainColor,
                        style: TextStyle(color: Colors.black),
                        validator: _validateAge,
                        keyboardType: TextInputType.number,
                        controller: ageController,
                        decoration: InputDecoration(
                          labelText: "Age",
                          filled: true,
                          fillColor: AppColors.inputBackground,

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),

                          labelStyle: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                          ),

                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: AppColors.mainColor
                            ), // Default border color
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: AppColors.mainColor,
                                width: 2.0
                            ), // Custom focus color
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red), // Border on error
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red, width: 2), // Border on error when focused
                          ),


                        ),
                      ),
                    ),

                    // Grade
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      child: DropdownButtonFormField<String>(
                            value: selectedGrade,
                            decoration: InputDecoration(
                              labelText: 'Select Grade',
                              filled: true,
                              fillColor: AppColors.inputBackground,

                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),

                              labelStyle: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w700,
                              ),

                              errorStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: AppColors.mainColor
                                ), // Default border color
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: AppColors.mainColor,
                                    width: 2.0
                                ), // Custom focus color
                              ),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red), // Border on error
                              ),

                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red, width: 2), // Border on error when focused
                              ),

                            ),
                            icon: Icon(Icons.arrow_drop_down_circle_rounded, color: AppColors.mainColor),
                            dropdownColor: AppColors.inputBackground,

                            items: grades.map((String? grade) {
                              return DropdownMenuItem<String>(
                                value: grade.toString(),
                                child: Text("${grade}th Grade"),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGrade = newValue;
                              });
                            },
                          ),
                    ),

                    // END FORM

                    // Button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(

                          onPressed: () async {
                            // _formKey.currentState!.validate();
                            _submitForm(context);
                            // MyApp.setLocale(context, Locale('fr'));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            elevation: 5,
                            backgroundColor: AppColors.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                      ),
                    ),



                  ],
                ),
              )
          )
      ),
    );
  }
}