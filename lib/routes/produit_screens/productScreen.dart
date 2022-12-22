import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/widgets/WidgetBottomNavigationBar.dart';
import 'package:my_parfum/widgets/buttons/buttonProductScreen.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class productScreen extends StatefulWidget {
  productScreen({Key? key}) : super(key: key);

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Produits"),
      ),
      bottomNavigationBar: WidgetBottomNavigationBar(),
      body: Column(children: [
        //Parfums button
        ButtonProductScreen(
            titel: 'Parfums',
            imageBackGround: 'images/Parfums.png',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('Parfum veiw Screen');
            }),
        //Parfums button
        ButtonProductScreen(
            titel: 'Maquillage',
            imageBackGround: 'images/Maquillage.png',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('MakeUp veiw Screen');
            }),
        //Parfums button
        ButtonProductScreen(
            titel: 'Autres',
            imageBackGround: 'images/Autres.png',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('Autres veiw Screen');
            }),
      ]),
    );
  }
}
