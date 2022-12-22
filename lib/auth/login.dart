// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/text_field__item.dart';
// import 'package:new_app/Login/pagesView/otpScreen.dart/otpscreen.dart';
// import 'package:new_app/core/CustomButton.dart';
// import 'package:new_app/core/SizeConfig.dart';
// import 'package:new_app/core/constants.dart';
// import 'package:new_app/core/text_field__item.dart';

class LoginView extends StatefulWidget {
  static const id = 'LoginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: Colors.white,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      top: SizeConfig.defaultSize! * 10,
                      left: SizeConfig.defaultSize! * 10,
                      right: SizeConfig.defaultSize! * 10,
                      child: Center(
                          child: Image.asset(
                        'images/my parfum.png',
                        height: SizeConfig.defaultSize! * 20,
                        width: SizeConfig.defaultSize! * 20,
                      ))),
                  Positioned(
                    top: SizeConfig.defaultSize! * 40,
                    left: SizeConfig.defaultSize! * 4,
                    right: SizeConfig.defaultSize! * 4,
                    child: CompleteInfoItem(
                      text: ' Entez votre numéro de téléphone',
                      inputType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.defaultSize! * 54,
                    left: SizeConfig.defaultSize! * 4,
                    right: SizeConfig.defaultSize! * 4,
                    child: CustomGeneralButton(
                      text: 'connexion',
                      onTap: () {
                        if (kDebugMode) {
                          print(_controller.text);
                        }
                        Navigator.of(context).pushNamed("OTP Screen");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
