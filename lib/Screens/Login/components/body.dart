import 'package:devcredit/Screens/Login/components/background.dart';
import 'package:devcredit/components/already_have_an_account_acheck.dart';
import 'package:devcredit/components/rounded_button.dart';
import 'package:devcredit/components/rounded_input_field.dart';
import 'package:devcredit/contains.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:devcredit/providers/login_state.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  AnimationController controller;
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _loginState = Provider.of<LoginState>(context, listen: false);
    return ChangeNotifierProvider<LoginState>(
      create: (context) => LoginState(),
      child: ModalProgressHUD(
          inAsyncCall: Provider.of<LoginState>(context).isLoading(),
          child: Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Image.asset('assets/images/signup.png',
                      height: size.height * 0.30),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    controller: _accountController,
                    hintText: "Your Account",
                    keyboardType: TextInputType.text,
                  ),
                  RoundedInputField(
                    controller: _passwordController,
                    hintText: "Your Password",
                    keyboardType: TextInputType.number,
                  ),
                  RoundedButton(
                    text: "LOGIN" + _loginState.getUser().toString(),
                    color: isValid ? kPrimaryColor : Colors.grey,
                    press: isValid
                        ? () {
                            _loginState.setLoading = true;
                            String account = _accountController.text;
                            String password =_passwordController.text;
                            _loginState.login(account, password);
                          }
                        : () {},
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlredyHaveAnAccountCheck(
                    press: () {},
                  ),
                ],
              ),
            ),
          ),),
    );
  }

}

