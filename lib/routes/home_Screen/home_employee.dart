import 'package:flutter/material.dart';
import 'package:my_parfum/functions/getTime.dart';
import 'package:my_parfum/routes/home_Screen/cercle.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/routes/produit_screens/productScreen.dart';
import 'package:my_parfum/routes/statistiques_screens/StatistiquesScreen.dart';
import 'package:my_parfum/routes/ventes_screens/WidgetVeiwOrder.dart';
import 'package:my_parfum/routes/ventes_screens/ventes_screen.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/WidgetBottomNavigationBar.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/Core/constants.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/widgetAppBar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//================================================================================================================

class Home_emp extends StatefulWidget {
  Home_emp({Key? key}) : super(key: key);

  @override
  State<Home_emp> createState() => _Home_empState();
}

var x = 0;
double prix_totale = 0;
List Listx = [];

class _Home_empState extends State<Home_emp> {
  @override
  void initState() {
    // TODO: implement initState
    print("1================================");
    getTimeToDay();

    super.initState();
  }

  //get Time To Day

  String dataEntree = "2022-11-15";

  Future getTimeToDay() async {
    print("2================================");

// 1 first / get time
    var dataEntreeGet = await getTime();
    dataEntree = '$dataEntreeGet';
    dataEntree = dataEntree.substring(0, 10);
    verfyReferancrToDay();
  }

  //verfy Referancr To Day

  Future verfyReferancrToDay() async {
    print("3================================");
    print(dataEntree);

    var refranceOrder = await FirebaseFirestore.instance.collection("Orders");
    await refranceOrder.doc(dataEntree).get().then((value) {
      if (value.exists == false) {
        print("3 /1================================");
        refranceOrder.doc(dataEntree).set({
          'orders': [],
          "IdTimeEnter": "$dataEntree",
          'DropBarValue': false,
          "All-orders-D'achats": 0,
          "total-reveresnse-ordres-payes": 0,
          "total-profti-ordres-payes": 0,
          "All-orders-payes": 0,
          "total-reveresnse-ordres-Nopayes": 0,
          "total-profti-ordres-Nopayes": 0,
          "All-orders-Nopayes": 0,
        });
        getOrderToDay();
      } else {
        print("3 /2================================");

        getOrderToDay();
      }
    });
  }

  //get Order To Day

  Future getOrderToDay() async {
    print("4================================");

    // 2 scond /
    var refranceOrder =
        await FirebaseFirestore.instance.collection("Orders").doc(dataEntree);

    refranceOrder.get().then((value) {
      print(value);
      setState(() {
        var orderDay = value.data();
        all_orders_payes = orderDay!['All-orders-payes'];
        all_orders_NoPayes = orderDay['All-orders-Nopayes'];
        all_orders_Dachats = orderDay["All-orders-D'achats"];
        Listx = orderDay['orders'];

        //

        int reveresnse = orderDay['total-reveresnse-ordres-Nopayes'] +
            orderDay['total-reveresnse-ordres-payes'];
      });

      //قلب ليست
      setState(() {
        List x = Listx.reversed.toList();
        ;
        Listx.clear();
        Listx = x;
      });

      //
    });
  }

  int all_orders_payes = 0;
  int all_orders_NoPayes = 0;
  int all_orders_Dachats = 0;

  //

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Acceuil"),
        ),
        bottomNavigationBar: WidgetBottomNavigationBar(),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              //button novo ventes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        tapButton1();
                        Navigator.of(context)
                            .pushReplacementNamed("New Order Screen");
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 35,
                            ),
                            CustomText(
                                text: 'Nouveau vente',
                                TextSize: 16,
                                TextColor: Colors.black,
                                TextWeight: FontWeight.w500)
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        height: 100,
                        //width: 500,
                        decoration: BoxDecoration(
                          //Border size & Colors
                          color: Color.fromARGB(237, 185, 185, 185),

                          //BorderRadius

                          borderRadius: BorderRadius.circular(10),

                          // The BoxShadow
                        ), //BoxD
                      ),
                    ),
                  ),
                  //

                  SizedBox(
                    height: 10,
                  ),

                  cercle(
                    radius: 80,
                    nbr_non_payee: all_orders_NoPayes,
                    nbr_payee: all_orders_payes,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Expanded(
                    child: Listx.length == 0
                        ? Center(child: Text("loading..."))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: Listx.length,
                            itemBuilder: (context, index) {
                              //Widget veiw order
                              return WidgetVeiwOrder(
                                  indexGetList:
                                      '${Listx[index].keys.toString().substring(1, Listx[index].keys.toString().length - 1)}',
                                  itemes_Product: Listx[index]
                                      .values
                                      .first['itemes_Product'],
                                  onTap: () {
                                    print("#################################");
                                    print(
                                        '${Listx[index].keys.toString().substring(1, Listx[index].keys.toString().length - 1)}');
                                  },
                                  name_Adder:
                                      Listx[index].values.first['name_Adder'],
                                  price_ordre:
                                      Listx[index].values.first['price_ordre'],
                                  payee_ordre:
                                      Listx[index].values.first['payee_ordre'],
                                  timeEnter:
                                      Listx[index].values.first['timeEnter'],
                                  total_profti:
                                      Listx[index].values.first['total_profti'],
                                  total_reveresnse: Listx[index]
                                      .values
                                      .first['total_reveresnse']);
                            }),
                  )
                ],
              )
            ])));
  }
}













//############################################################################




//#############################################################################


// Container(
//                               margin: EdgeInsets.all(5),
//                               decoration: const BoxDecoration(
//                                 color: Color(0xffa7dca8),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5)),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       height: 160,
//                                       decoration: BoxDecoration(
//                                         color: Listx[index]
//                                                     .values
//                                                     .first['payee_ordre'] ==
//                                                 true
//                                             ? Color(0xffeef6ef)
//                                             : Color.fromARGB(
//                                                 255, 247, 197, 197),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(5)),
//                                       ),
//                                       child: ListView.builder(
//                                           itemCount: Listx[index]
//                                               .values
//                                               .first['itemes_Product']
//                                               .length,
//                                           itemBuilder: (context, i) {
//                                             return Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 2, left: 3, right: 3),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   color: Color.fromARGB(
//                                                       0, 238, 246, 239),
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(5)),
//                                                 ),
//                                                 height: 50,
//                                                 child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Text(
//                                                                 "${Listx[index].values.first['itemes_Product'][i]['nameProduct']}"),
//                                                             Text(
//                                                               "(${Listx[index].values.first['itemes_Product'][i]['type_Prodct']})",
//                                                               style: TextStyle(
//                                                                   fontSize: 10),
//                                                             ),
//                                                           ]),
//                                                       Expanded(
//                                                           child: SizedBox(
//                                                         width: 5,
//                                                       )),
//                                                       Card(
//                                                         color: Listx[index]
//                                                                         .values
//                                                                         .first[
//                                                                     'payee_ordre'] ==
//                                                                 true
//                                                             ? Color(0xffeef6ef)
//                                                             : Color.fromARGB(
//                                                                 255,
//                                                                 247,
//                                                                 197,
//                                                                 197),
//                                                         elevation: 3,
//                                                         child: Row(
//                                                           children: [
//                                                             Text(
//                                                                 Listx[index].values.first['itemes_Product'][i]
//                                                                             [
//                                                                             'type_Prodct'] ==
//                                                                         'Parfum'
//                                                                     ? "${Listx[index].values.first['itemes_Product'][i]['count_ml']}"
//                                                                     : "${Listx[index].values.first['itemes_Product'][i]['count_peieces']}",
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         10)),
//                                                             Text(
//                                                                 Listx[index].values.first['itemes_Product'][i]
//                                                                             [
//                                                                             'type_Prodct'] ==
//                                                                         'Parfum'
//                                                                     ? "ml"
//                                                                     : "peice",
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         10)),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                           child: SizedBox(
//                                                         width: 5,
//                                                       )),
//                                                       Card(
//                                                         color: Listx[index]
//                                                                         .values
//                                                                         .first[
//                                                                     'payee_ordre'] ==
//                                                                 true
//                                                             ? Color(0xffeef6ef)
//                                                             : Color.fromARGB(
//                                                                 255,
//                                                                 247,
//                                                                 197,
//                                                                 197),
//                                                         elevation: 3,
//                                                         child: Text(
//                                                           "${list[i]["prix"]} DA",
//                                                           style: TextStyle(
//                                                               fontSize: 10),
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                           child: SizedBox(
//                                                         width: 5,
//                                                       )),
//                                                     ]),
//                                                 // margin: EdgeInsets.only(top: 2),
//                                               ),
//                                             );
//                                           }),
//                                     ),
//                                   ),

//                                   Container(
//                                     height: 160,
//                                     width: 100,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 80),
//                                           child: Text(
//                                             "# ${Listx[index].keys.toString().substring(1, 2)}",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         Text(
//                                           "${Listx[index].values.first['price_ordre']} DA",
//                                           style: TextStyle(
//                                               color: Listx[index].values.first[
//                                                           'payee_ordre'] ==
//                                                       true
//                                                   ? Colors.green
//                                                   : Colors.red,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           "${Listx[index].values.first['timeEnter']}",
//                                           style: TextStyle(
//                                               color: Color(0xfff1fdf1),
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 10),
//                                         ),
//                                       ],
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Listx[index]
//                                                   .values
//                                                   .first['payee_ordre'] ==
//                                               true
//                                           ? Color(0xffa7dca8)
//                                           : Color.fromARGB(255, 220, 167, 167),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5)),
//                                     ),
//                                   ),
//                                   //
//                                 ],
//                               ),
//                             );