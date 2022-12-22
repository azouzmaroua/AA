import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInterntScreen extends StatefulWidget {
  NoInterntScreen({Key? key}) : super(key: key);

  @override
  State<NoInterntScreen> createState() => _nameState();
}

class _nameState extends State<NoInterntScreen> {
  late StreamSubscription _connectivitySubscription;
  ConnectivityResult? _connectivityResult;

  @override

  //=============vefy conection when start app========================
  Future<void> checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      print('Connected to a Wi-Fi network');
      Navigator.of(context).pop();
    } else if (result == ConnectivityResult.mobile) {
      print('Connected to a mobile network');
      Navigator.of(context).pop();
    } else {
      print('Not connected to any network');
    }

    setState(() {
      _connectivityResult = result;
    });
  }

  //
  void initState() {
    checkConnectivityState();
    super.initState();

    //============vefy conection when changed========================================
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('Current connectivity status: $result');
      _connectivityResult = result;
      if (result == ConnectivityResult.wifi) {
        Navigator.of(context).pop();
      }
    });
  }

  //===============================================
  dispose() {
    super.dispose();

    _connectivitySubscription.cancel();
  }

  //===============================================

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "no Enternt",
          style: TextStyle(
              fontSize: 31, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
