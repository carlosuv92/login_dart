import 'package:devcredit/Screens/Login/components/background.dart';
import 'package:devcredit/components/already_have_an_account_acheck.dart';
import 'package:devcredit/components/rounded_button.dart';
import 'package:devcredit/components/rounded_input_field.dart';
import 'package:devcredit/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.30,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              onChanged: (value) {},
              hintText: "Your Account",
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlredyHaveAnAccountCheck(
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
