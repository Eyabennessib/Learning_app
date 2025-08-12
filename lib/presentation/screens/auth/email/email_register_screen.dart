import 'dart:developer';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';

class EmailRegisterScreen extends StatefulWidget{
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState()=> _EmailRegisterScreen();

}


class _EmailRegisterScreen extends State<EmailRegisterScreen> {
  final _auth = AuthService();
  final _localStorage = LocalStorage();
  final _formKey = GlobalKey<FormState>(); // Form key
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  bool _obscureTextCnfPassword = true;
  bool _obscureTextPassword = true;

  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value != passwordController.text.toString()) {
      return 'Password does not match!';
    }
    return null;
  }

  // Email Validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Simple email regex validation
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login or further logic
      final user = await _auth.createUserEmailPassword(emailController.text, passwordController.text);

      if(user[0] == null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(user[1]),
            backgroundColor: Colors.red,
          ),
        );
      }else{
        emailController.clear();
        passwordController.clear();
        confPasswordController.clear();

        _localStorage.saveUserId(user[0]);

        goToFillProfile(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        "Sign Up",
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
                        "Create an account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 50.0),
                      child: TextFormField(

                        cursorColor: AppColors.mainColor,
                        validator: _validateEmail,
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "example@gmail.com",
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

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        obscureText: _obscureTextPassword,
                        cursorColor: AppColors.mainColor,
                        style: TextStyle(color: Colors.black),
                        validator: _validatePassword,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainColor
                          ),
                          filled: true,
                          fillColor: AppColors.inputBackground,

                          suffixIcon:  IconButton(
                            icon: Icon(
                              _obscureTextPassword ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureTextPassword = !_obscureTextPassword;
                              });
                            },
                          ),

                          hintStyle: TextStyle(
                            color: Colors.grey,
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
                            borderSide: BorderSide(color: AppColors.mainColor, width: 2.0), // Custom focus color
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

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        obscureText: _obscureTextCnfPassword,
                        cursorColor: AppColors.mainColor,
                        style: TextStyle(color: Colors.black),
                        validator: _validateConfPassword,
                        keyboardType: TextInputType.text,
                        controller: confPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w700,

                          ),

                          filled: true,
                          fillColor: AppColors.inputBackground,

                          suffixIcon:  IconButton(
                            icon: Icon(
                              _obscureTextCnfPassword ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureTextCnfPassword = !_obscureTextCnfPassword;
                              });
                            },
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
                            borderSide: BorderSide(
                                color: Colors.red
                            ), // Border on error
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2
                            ), // Border on error when focused
                          ),

                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(

                        onPressed: () async {
                          // _formKey.currentState!.validate();
                          _submitForm();
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Image.asset(
                                AppAssets.arrowRightCutout,
                              ),
                            ),


                          ],
                        )
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      transformAlignment: Alignment.center,
                      // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 60.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers children horizontally
                        crossAxisAlignment: CrossAxisAlignment.center, // Centers children vertically
                        children: [
                          Text(
                            "Already have an account ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              goToLoginOption(context);
                            },
                            child: Text(
                              " Sign In",
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
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
