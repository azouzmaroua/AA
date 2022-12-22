import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/text_field__item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController controller = new TextEditingController();
  String nameSing = "";
  @override
  Future saveName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("name", nameUser);
    Navigator.of(context).pushReplacementNamed("home Screen");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/myParfum.png',
            height: 200,
            width: 200,
          ),
          //text form feiled
          Container(
            width: 500,
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              obscureText: true,
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: (v) {},
              onSaved: (ve) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "enter your code",
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFCCCCCC),
                    )),
              ),
            ),
          ),
          //
          Container(
            width: 500,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: CustomGeneralButton(
              color: kMainColor,
              text: 'confirmer',
              onTap: () async {
                var refranceUser =
                    await FirebaseFirestore.instance.collection("user_app");

                await refranceUser
                    .where("code", isEqualTo: controller.text)
                    .get()
                    .then((value) {
                  if (value.docs.isNotEmpty == true) {
                    value.docs.forEach((element) {
                      print("########################################");
                      nameUser = element.data()["name"];

                      saveName();
                      print(element.data()["name"]);
                    });
                  } else {
                    AwesomeDialog(
                      //   useRootNavigator: false,
                      context: context,
                      title: "warning",
                      desc: "this user not found",
                      btnOkOnPress: () {},
                      btnCancelOnPress: () {},

                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                    )..show();
                  }
                });

                // if ("textFormFeild.text" == "CodeApp") {
                // } else {
                //   AwesomeDialog(
                //     //   useRootNavigator: false,
                //     context: context,
                //     title: "Erroer",
                //     desc: "code not truth",
                //     btnOkOnPress: () {},
                //     btnCancelOnPress: () {},

                //     dialogType: DialogType.error,
                //     animType: AnimType.rightSlide,
                //   )..show();
                // }
              },
            ),
          ),
          // CustomGeneralButton(
          //   text: 'connexion',
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
