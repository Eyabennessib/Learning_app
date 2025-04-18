import 'dart:developer';

import 'package:dummy_app/core/routers.dart';
import 'package:dummy_app/presentation/screens/auth/options/register_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../email/email_register_screen.dart';

class OtpLoginScreen extends StatefulWidget{
  const OtpLoginScreen({super.key});

  @override
  State<OtpLoginScreen> createState()=> _OtpLoginScreen();

}


class _OtpLoginScreen extends State<OtpLoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number!';
    }

    return null;
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
                    "Enter your phone number",
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
                  child: IntlPhoneField(
                    initialCountryCode: 'US',
                    cursorColor: AppColors.mainColor,
                    // validator: _validatePhone,
                    keyboardType: TextInputType.number,
                    // controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone",
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
                    onChanged: (phone) {
                      setState(() {
                        // phoneNumber = phone.completeNumber;
                        phoneController.text = phone.completeNumber; // ✅ Update controller text
                      });
                      log("Full Number: ${phone.completeNumber}"); // e.g., +1234567890
                      log("National Number: ${phone.number}");    // e.g., 234567890
                      log("Country Code: ${phone.countryCode}"); // e.g., +1
                    },
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      goToOtp(context, "123456");
                      // _formKey.currentState!.validate();
                      // _submitForm();
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
                      'Send Code',
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
}
