import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/functions/getTime.dart';
import 'package:my_parfum/routes/statistiques_screens/static.dart';
import 'package:my_parfum/routes/statistiques_screens/view_statistics.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_dropDown_time.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_scrol_monthes_button.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_view_statistics.dart';
import 'package:my_parfum/routes/ventes_screens/widgetBarChoesTime.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/WidgetBottomNavigationBar.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';

class StatistiquesScreen extends StatefulWidget {
  StatistiquesScreen({Key? key}) : super(key: key);

  @override
  State<StatistiquesScreen> createState() => _StatistiquesScreenState();
}

class _StatistiquesScreenState extends State<StatistiquesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print("1================================");
    getTimeToDay();

    super.initState();
  }

  bool ladingStatistiquesScreen = false;

  //get Time To Day

  String dataEntree = "2022-11-15";
  String dataEntreeMonth = "11";
  String dataEntreeYear = "2022";

  Future getTimeToDay() async {
    print("2================================");

// 1 first / get time
    var dataEntreeGet = await getTime();
    dataEntree = '$dataEntreeGet';
    dataEntree = dataEntree.substring(0, 10);
    dataEntreeMonth = dataEntree.substring(5, 7);
    dataEntreeYear = dataEntree.substring(0, 4);
    setState(() {
      dropdownValueMonth = listMonth[int.parse(dataEntreeMonth) - 1];
      activeButtonMonth = int.parse(dataEntreeMonth) - 1;
      //
      dropdownValueYear = dataEntreeYear;
    });

    getData();
  }

  //2 second get
  List listVentes = [];

  getData() async {
    var refranceOrder = await FirebaseFirestore.instance.collection("Orders");

    await refranceOrder
        .where("IdTimeEnter",
            isLessThanOrEqualTo: '$dataEntreeYear-$dataEntreeMonth-31')
        .where("IdTimeEnter",
            isGreaterThanOrEqualTo: '$dataEntreeYear-$dataEntreeMonth-01')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("22================================");
        print(element.data());

        // x = x.addAll({"idTime": "${element.id}"});
        // x = x.addAll({"idTime": "${element.id}"});

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

        ladingStatistiquesScreen = true;
      });
    });
    print("3================================");
    print("$listVentes");
  }

  Widget build(BuildContext context) {
    List x = listVentes.reversed.toList();
    x.forEach((element) {
      print(element);
    });
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          tapButton1();
          Navigator.of(context).pushReplacementNamed("MyHomePage");
        },
        backgroundColor: greenColor,
        child: Icon(Icons.bar_chart),
      ),*/
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Statistiques"),
      ),
      bottomNavigationBar: WidgetBottomNavigationBar(),
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: Column(
        children: [
          WidgetBarChoesTime(),
          Row(
            children: [
              widgetDropDownMonth(
                  dropdownValue: dropdownValueMonth,
                  onChanged: () {
                    setState(() {
                      activeButtonMonth = activeButtonMonth;
                      dropdownValueMonth = dropdownValueMonth;
                      //get data
                      dataEntreeMonth = "${activeButtonMonth + 1}";
                      listVentes.clear();
                      getData();
                      ////ladingVentesScreen

                      ladingStatistiquesScreen = false;
                    });
                  }),
              widgetDropDownYear(
                  dropdownValue: dropdownValueYear,
                  onChanged: () {
                    setState(() {
                      dropdownValueYear = dropdownValueYear;

                      //get data
                      dataEntreeYear = dropdownValueYear;
                      listVentes.clear();
                      getData();
                      ////ladingVentesScreen

                      ladingStatistiquesScreen = false;
                    });
                  }),
            ],
          ),
          // WidgetDropDownMonth(),
          widgetSscrolMonthesButton(onTap: () {
            setState(() {
              activeButtonMonth = activeButtonMonth;
              dropdownValueMonth = listMonth[activeButtonMonth];

              //get data
              dataEntreeMonth = "${activeButtonMonth + 1}";

              listVentes.clear();
              getData();
              ////ladingVentesScreen

              ladingStatistiquesScreen = false;
            });
          }),
          Expanded(
            child: ladingStatistiquesScreen == false
                ? LadingAnmation()
                : SizedBox(
                    child: listVentes.length == 0
                        ? Center(
                            child: Text("pas des items"),
                          )
                        : SizedBox(
                            child: ListView.builder(
                                itemCount: listVentes.length,
                                itemBuilder: (context, index) {
                                  return widget_View_Statistics(
                                      timeEnterExplain: "  ",
                                      non_payes: listVentes[index]
                                          ['All-orders-Nopayes'],
                                      payes: listVentes[index]
                                          ['All-orders-payes'],
                                      profit: listVentes[index]
                                              ['total-profti-ordres-payes'] +
                                          listVentes[index]
                                              ['total-profti-ordres-Nopayes'],
                                      revenue: listVentes[index][
                                              'total-reveresnse-ordres-payes'] +
                                          listVentes[index][
                                              'total-reveresnse-ordres-Nopayes'],
                                      total: listVentes[index]
                                          ["All-orders-D'achats"],
                                      timeEnter: listVentes[index]
                                          ["IdTimeEnter"]);
                                }),
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
