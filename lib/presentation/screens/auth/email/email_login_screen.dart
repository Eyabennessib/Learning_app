import 'dart:developer';
import 'package:dummy_app/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:dummy_app/core/services/local-storage/user-id/local_storage.dart';

class EmailLoginScreen extends StatefulWidget{
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState()=> _EmailLoginScreen();

}


class _EmailLoginScreen extends State<EmailLoginScreen> {
  final _auth = AuthService();
  final _localStorage = LocalStorage();
  final _formKey = GlobalKey<FormState>(); // Form key
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    margin: const EdgeInsets.only(top: 100.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign In",
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
                      "Sign in into account",
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
                    margin: const EdgeInsets.only(top: 70.0),
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
                      obscureText: _obscureText,
                      cursorColor: AppColors.mainColor,
                      style: TextStyle(color: Colors.black),
                      validator: _validatePassword,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon:  IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.mainColor,
                            ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
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
                        child:  Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800
                          ),
                        ),
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
                          "Don't have an account ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            goToRegisterOption(context);
                          },
                          child: Text(
                            " Sign Up",
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

                  // Button

                ],
              ),
          ),
        ),
      ),
    );
  }

  _login() async {
    final user =
    await _auth.loginUserWithEmailAndPassword(emailController.text, passwordController.text);

    if (user[0] != null) {
      _localStorage.saveUserId(user[0]);
      goToHome(context);
    } else{
      log("Cannot login");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(user[1]),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
