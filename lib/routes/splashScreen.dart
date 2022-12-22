import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String nameUser = "";

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getName();
    super.initState();
  }

  Future remove() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("name");
  }

  Future getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var x = await pref.getString("name");
    setState(() {
      nameUser = "$x";
    });
    print("=============================");

    print(nameUser);

    ChangeScreen();
  }
  // function work when time end

  Future ChangeScreen() async {
    await Future.delayed(Duration(seconds: 3), () {
      if (nameUser == "null") {
        Navigator.of(context).pushReplacementNamed("Login Screen");
      } else {
        Navigator.of(context).pushReplacementNamed("home Screen");
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/myParfum.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
