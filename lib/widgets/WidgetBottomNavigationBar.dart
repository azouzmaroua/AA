import 'package:flutter/material.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/soundUi.dart';

int currentIndex = 0;

class WidgetBottomNavigationBar extends StatefulWidget {
  WidgetBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<WidgetBottomNavigationBar> createState() =>
      _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        tapButton1();
        setState(() {
          currentIndex = index;
          if (index == 0) {
            //  titelAppBar = 'Home';

            Navigator.of(context).pushReplacementNamed('home Screen');
          } else if (index == 1) {
            //titelAppBar = 'Ventes';

            Navigator.of(context).pushReplacementNamed('ventes Screen');
          } else if (index == 2) {
            //titelAppBar = 'Produits';

            Navigator.of(context).pushReplacementNamed('product Screen');
          } else if (index == 3) {
            //titelAppBar = 'Statistiques';

            Navigator.of(context).pushReplacementNamed('Statistiques Screen');
          }
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded), label: "Accueil"),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward), label: "Ventes"),
        BottomNavigationBarItem(
            //Icon feather-box
            icon: Icon(Icons.check_box_sharp),
            label: "Produits"),
        BottomNavigationBarItem(
            icon: Icon(Icons.today_sharp), label: "Statistiques"),
      ],
    );
  }
}

Widget widgetBottomNavigationBar(
  context, {
  required Null Function(int index) onTap,
  required int currentIndex,
}) {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    currentIndex: currentIndex,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      tapButton1();
      onTap(index);
    },
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.house_rounded), label: "Accueil"),
      BottomNavigationBarItem(icon: Icon(Icons.arrow_forward), label: "Ventes"),
      BottomNavigationBarItem(
          //Icon feather-box
          icon: Icon(Icons.check_box_sharp),
          label: "Produits"),
      BottomNavigationBarItem(
          icon: Icon(Icons.today_sharp), label: "Statistiques"),
    ],
  );
}
