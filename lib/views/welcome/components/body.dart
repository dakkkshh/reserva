import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva/components/rounded_button.dart';
import 'package:reserva/views/login/login.dart';
import 'package:reserva/views/signup/signup.dart';
import 'package:reserva/views/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
          RoundedButton(
              key: key,
              text: "LOGIN",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              }),
          RoundedButton(
              key: key,
              text: "SIGNUP",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupView()));
              })
        ],
      ),
    );
  }
}
