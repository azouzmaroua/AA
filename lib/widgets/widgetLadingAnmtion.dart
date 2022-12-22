import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LadingAnmation extends StatelessWidget {
  const LadingAnmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: SpinKitFadingCircle(
          color: Colors.grey,
          size: 50.0,
        ),
      )),
    );
  }
}
