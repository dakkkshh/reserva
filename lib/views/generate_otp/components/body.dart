import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva/components/otp_input.dart';
import 'package:reserva/components/rounded_button.dart';
import 'package:reserva/components/rounded_input_field.dart';
import 'package:reserva/views/generate_otp/components/background.dart';
import 'package:reserva/views/home/home.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final phoneController = TextEditingController();
  final OTPController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationID;
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCred) async {
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCred);

      if (authCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeView();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // TODO
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: ${e.code}"),
      ));
    }
  }

  bool OTP_generated = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   "Welcome to reserva",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          SvgPicture.asset(
            "asset/icons/chat.svg",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.05),
          RoundedInputField(
            hintText: "Your Phone Number",
            onChanged: (value) {
              phoneController.text = value;
            },
          ),
          RoundedOTPField(
            hintText: "OTP",
            onChanged: (value) {
              OTPController.text = value;
            },
          ),
          RoundedButton(
              text: OTP_generated ? "SUBMIT" : "GENERATE OTP",
              press: () async {
                if (OTP_generated) {
                  PhoneAuthCredential phoneAuthCred =
                      PhoneAuthProvider.credential(
                          verificationId: verificationID,
                          smsCode: OTPController.text);
                  signInWithPhoneAuthCredential(phoneAuthCred);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP Submitted"),
                  ));
                } else {
                  await _auth.verifyPhoneNumber(
                    phoneNumber: "+91" + phoneController.text,
                    verificationCompleted: (phoneAuthCredential) async {
                      // signInWithPhoneAuthCredential(phoneAuthCredential);
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text("OTP Generated"),
                      // ));
                      print("In verificationCompleted");
                    },
                    verificationFailed: (verificationFailed) async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(verificationFailed.message.toString()),
                      ));
                    },
                    codeSent: (verificationID, resendingToken) async {
                      //Toast
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP Generated"),
                      ));
                      //Updating the UI
                      setState(() {
                        OTP_generated = true;
                        this.verificationID = verificationID;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationID) async {
                      print("In codeAutoRetrievalTimeout");
                    },
                  );
                }
              }),
        ],
      ),
    );
  }
}
