import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_view_statistics.dart';
import 'package:my_parfum/routes/ventes_screens/widgetBarChoesTime.dart';
import 'package:my_parfum/soundUi.dart';

class ScreenfilterStatics extends StatefulWidget {
  ScreenfilterStatics({Key? key}) : super(key: key);

  @override
  State<ScreenfilterStatics> createState() => _ScreenfilterStaticsState();
}

class _ScreenfilterStaticsState extends State<ScreenfilterStatics> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  List listVentes = [];

  getData() async {
    var refranceOrder = await FirebaseFirestore.instance.collection("Orders");

    await refranceOrder
        .where("IdTimeEnter", isLessThanOrEqualTo: '$choesTime2')
        .where("IdTimeEnter", isGreaterThanOrEqualTo: '$choesTime1')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("22================================");

        non_payes_filterStatics =
            non_payes_filterStatics + element['All-orders-Nopayes'];
        payes_filterStatics = payes_filterStatics + element['All-orders-payes'];
        profit_payes_filterStatics =
            profit_payes_filterStatics + element['total-profti-ordres-payes'];
        profit_Nopayes_filterStatics = profit_Nopayes_filterStatics +
            element['total-profti-ordres-Nopayes'];

        revenue_payes_filterStatics = revenue_payes_filterStatics +
            element['total-reveresnse-ordres-payes'];
        revenue_Nopayes_filterStatics = revenue_Nopayes_filterStatics +
            element['total-reveresnse-ordres-Nopayes'];
        all_orders_Dachats =
            all_orders_Dachats + element["All-orders-D'achats"];

        setState(() {
          listVentes.add(element.data());
        });
      });
      //قلب ليست
      setState(() {
        List x = listVentes.reversed.toList();
        ;
        listVentes.clear();
        listVentes = x;

        ////ladingVentesScreen

        //ladingStatistiquesScreen = true;
      });
    });
    print("3================================");
    print("$listVentes");
  }

  num non_payes_filterStatics = 0;
  num payes_filterStatics = 0;
  num profit_payes_filterStatics = 0;
  num profit_Nopayes_filterStatics = 0;

  num revenue_payes_filterStatics = 0;
  num revenue_Nopayes_filterStatics = 0;
  num all_orders_Dachats = 0;

  String timeEnter_filterStatics = choesTime1.toString().substring(0, 10) +
      " / " +
      choesTime2.toString().substring(0, 10);

  DateTime timeEnterExplain_filterStatics =
      choesTime2.subtract(Duration(days: choesTime1.day));

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        tapButton1();
        setState(() {
          choesTime1Bool = false;
          choesTime2Bool = false;
        });
        Navigator.of(context).pushReplacementNamed('Statistiques Screen');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    tapButton1();
                    Navigator.of(context)
                        .pushReplacementNamed('Statistiques Screen');

                    setState(() {
                      choesTime1Bool = false;
                      choesTime2Bool = false;
                    });
                  },
                  icon: Icon(Icons.arrow_back)),
              Text("Statistics Filtrer"),
              Text("     ")
            ],
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xff000000),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            WidgetBarChoesTime(),
            widget_View_Statistics(
                non_payes: non_payes_filterStatics,
                payes: payes_filterStatics,
                profit:
                    profit_payes_filterStatics + profit_Nopayes_filterStatics,
                revenue:
                    revenue_payes_filterStatics + revenue_Nopayes_filterStatics,
                total: all_orders_Dachats,
                timeEnter: timeEnter_filterStatics,
                timeEnterExplain:
                    timeEnterExplain_filterStatics.day.toString() + " Day"),
          ],
        ),
      ),
    );
  }
}
