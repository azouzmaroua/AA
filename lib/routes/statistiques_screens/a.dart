import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/routes/statistiques_screens/a/chart.dart';
import 'package:my_parfum/routes/statistiques_screens/static.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          tapButton1();
          Navigator.of(context).pushReplacementNamed('product Screen');
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Color.fromARGB(0, 255, 255, 255),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      tapButton1();
                      Navigator.of(context)
                          .pushReplacementNamed('Statistiques Screen');
                    },
                    icon: Icon(Icons.arrow_back)),
                Text("Statistiques de cette semaine"),
              ],
            ),
          ),
          body: chart(),
        ));
  }
}
