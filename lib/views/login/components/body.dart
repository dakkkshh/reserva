import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva/components/already_have_an_account_acheck.dart';
import 'package:reserva/components/rounded_button.dart';
import 'package:reserva/components/rounded_input_field.dart';
import 'package:reserva/components/rounded_password_field.dart';
import 'package:reserva/views/generate_otp/generate_otp.dart';
import 'package:reserva/views/login/components/background.dart';
import 'package:reserva/views/signup/components/or_divider.dart';
import 'package:reserva/views/signup/signup.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "asset/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Phone Number",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            OrDivider(),
            RoundedButton(
              text: "GENERATE OTP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GenerateOTP();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupView();
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
