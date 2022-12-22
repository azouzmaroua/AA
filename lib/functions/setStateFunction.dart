import 'package:flutter/material.dart';
import 'package:my_parfum/functions/choesImage.dart';

class SetStateFunction extends StatefulWidget {
  SetStateFunction({Key? key}) : super(key: key);

  @override
  State<SetStateFunction> createState() => _SetStateFunctionState();

  static void setStateFunction() {}
}

class _SetStateFunctionState extends State<SetStateFunction> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  setStateFunctionx(var retyrn) {
    setState(() {
      image = retyrn;
    });
  }
}
