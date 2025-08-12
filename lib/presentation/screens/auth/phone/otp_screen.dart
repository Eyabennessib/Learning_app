import 'dart:developer';
import 'package:dummy_app/core/routers/page-routers/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dummy_app/core/themes.dart';
import 'package:pinput/pinput.dart';


class OtpScreen extends StatefulWidget{
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState()=> _OtpScreen();

}


class _OtpScreen extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key
  final otpController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  String? _validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP code sent to your number!';
    }

    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try{
        // final cred = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otpController.text);
        // await _auth.signInWithCredential(cred);

        goToHome(context);
      }catch(e){
        log(e.toString());
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(
                  -MediaQuery.of(context).size.width * 0.35,
                  MediaQuery.of(context).size.height * 0.01,
                ),
                child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  AppAssets.backButton,
                  width: 150,
                  height: 150,
                ),
              ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      // margin: const EdgeInsets.only(top: 0.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Verification",
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
                        "Enter verification code",
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
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(

                            border: Border.all(
                              color: AppColors.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onCompleted: (pin) => print('Completed: $pin'),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 30.0),
                      alignment: Alignment.center,
                      child: Text("1:00",
                        style: TextStyle(
                            color: AppColors.mainTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      child: Text("We have sent a verification code to your phone ***********. You can check your message",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.center,
                      child: Text("I didn’t receive the code? send again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(top: 30.0),
                      child: ElevatedButton(

                        onPressed: () async {
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
                          'Verify',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ),

                    // Button

                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
