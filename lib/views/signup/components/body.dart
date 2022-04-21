import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva/components/already_have_an_account_acheck.dart';
import 'package:reserva/components/otp_input.dart';
import 'package:reserva/components/rounded_button.dart';
import 'package:reserva/components/rounded_input_field.dart';
import 'package:reserva/views/login/login.dart';
import 'package:reserva/views/signup/components/background.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool OTP_generated = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "asset/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Phone Number",
              onChanged: (value) {},
            ),
            RoundedOTPField(
              hintText: "OTP",
              onChanged: (value) {},
            ),
            // RoundedPasswordField(
            //   onChanged: (value) {},
            // ),
            // OrDivider(),
            RoundedButton(
              text: OTP_generated ? "SUBMIT" : "GENERATE OTP",
              press: () {
                if (OTP_generated) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP Submitted"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP Generated"),
                  ));
                  setState(() {
                    OTP_generated = true;
                  });
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
