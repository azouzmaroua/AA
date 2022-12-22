import 'package:flutter/material.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/data/addOrders.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/bottomSheet/choesEnterOrderBottomSheet.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/notification/NotificationLading.dart';
import 'package:my_parfum/widgets/space_widgets.dart';

class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

bool visibleTotalPrice = false;
bool payee_ordre = false;
num totalPrice = 0;
num total_profti = 0;
num total_reveresnse = 0;

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if (listOrder.length > 0) {
        visibleTotalPrice = true;
      } else {
        visibleTotalPrice = false;
      }

      //calcolut totalPrice
      totalPrice = 0;
      total_profti = 0;
      total_reveresnse = 0;

      listOrder.forEach((element) {
        totalPrice = totalPrice + element["price"];
        total_profti = total_profti + element["price_profit"];
        total_reveresnse = total_reveresnse + element["price"];
      });
      //
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        tapButton1();
        listOrder.clear();
        Navigator.of(context).pushReplacementNamed('home Screen');

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    tapButton1();
                    listOrder.clear();

                    Navigator.of(context).pushReplacementNamed('home Screen');
                  },
                  icon: Icon(Icons.arrow_back)),
              Text("Nouveau ventes"),
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
          backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        ),
        body: Column(children: [
          Container(
            width: 700,
            height: 50,
            margin: EdgeInsets.all(20),
            child: CustomGeneralButton(
              color: blueColor,
              text: 'ajouter un autre produit',
              onTap: () {
                tapButton1();
                Navigator.of(context)
                    .pushReplacementNamed("Chosing Product Screen");
                // showBottomChoesOrder(context);
              },
            ),
          ),
          Expanded(
              child: listOrder.length == 0
                  ? Center(
                      child: Text("vous ne choisisez aucun produit"),
                    )
                  : ListView.builder(
                      itemCount: listOrder.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          confirmDismiss: (direction) async {
                            DismissDirection.down;
                            listOrder.removeAt(index);
                            Navigator.of(context)
                                .pushReplacementNamed("New Order Screen");

                            // NotificationConfirmDelegetProduct(
                            //   context,
                            //   UrlImages: listProductParfums[index]['UrlImages'],
                            //   intituleParfum: listProductParfums[index]['intituleParfum'],
                            //   QuantiteInitiale: listProductParfums[index]
                            //       ['QuantiteInitiale'],
                            //   QuantiteNow: listProductParfums[index]['QuantiteNow'],
                            //   dataEntree: listProductParfums[index]['dataEntree'],
                            //   FullCondistion: listProductParfums[index]['FullCondistion'],
                            //   PrixDeLunite: listProductParfums[index]['PrixDeLunite'],
                            //   indexItem: index,
                            // );
                          },
                          onResize: () {},
                          key: Key('$index'),
                          background: Container(),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete, color: Colors.white),
                                  Text('Move to trash',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          child: widgetVeiwProductParfum(
                              type_Prodct: listOrder[index]["type_Prodct"],
                              PrixDeLunite: listOrder[index]["price"],
                              QuantiteOrder:
                                  listOrder[index]["type_Prodct"] == "Parfum"
                                      ? listOrder[index]["count_ml"]
                                      : listOrder[index]["count_peieces"],
                              UrlImages: listOrder[index]["urlImage_Product"],
                              intituleParfum: listOrder[index]["nameProduct"]),
                        );
                      },
                    )),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: visibleTotalPrice,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Total A payée',
                    TextSize: 18,
                    TextColor: colorGray,
                    TextWeight: FontWeight.w500,
                  ),
                  HorizintalSpace(15),
                  CustomText(
                    text: '$totalPrice DA',
                    TextSize: 18,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: colorGray),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visibleTotalPrice,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              print(
                                  "============================= $payee_ordre");
                              setState(() {
                                payee_ordre == false
                                    ? payee_ordre = true
                                    : payee_ordre = false;
                              });
                            },
                            child: payee_ordre == false
                                ? Icon(
                                    Icons.circle_outlined,
                                    size: 50,
                                    color: orgneColor,
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                    size: 50,
                                    color: greenColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Etat de la commande",
                              TextSize: 18,
                              TextColor: Colors.black,
                              TextWeight: FontWeight.w700,
                            ),
                            CustomText(
                              text: payee_ordre == false ? "no payee" : "payee",
                              TextSize: 18,
                              TextColor: payee_ordre == false
                                  ? orgneColor
                                  : greenColor,
                              TextWeight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 700,
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CustomGeneralButton(
                    color: greenColor,
                    text: 'valider',
                    onTap: () {
                      messageLading(context);
                      AddOrder(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget widgetVeiwProductParfum({
  required String UrlImages,
  required String intituleParfum,
  required String type_Prodct,
  required num QuantiteOrder,
  required num PrixDeLunite,

  // "FullCondistion": "Full",
}) {
  return Container(
    child: Row(
      children: [
        //image parfum
        Image.network(
          UrlImages,
          height: 80,
          width: 80,
        ),
        SizedBox(
          width: 7,
        ),
        //
        Column(
          children: [
            // name parfum
            CustomText(
              text: intituleParfum,
              TextSize: 14,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),

            // Il reste
            CustomText(
              text: type_Prodct == "Parfum"
                  ? '$QuantiteOrder ml'
                  : '$QuantiteOrder peieces',
              TextSize: 14,
              TextColor: colorGray,
              TextWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(
          width: 14,
        ),
        // price
        CustomText(
          text: "$PrixDeLunite DA",
          TextSize: 14,
          TextColor: Colors.black,
          TextWeight: FontWeight.w900,
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,

      // The BoxShadow

      boxShadow: [
        BoxShadow(
          //ifs select change shadow color
          color: Color.fromARGB(255, 194, 192, 192),
          offset: const Offset(
            0.0,
            2.0,
          ),
          blurRadius: 3.0,
          spreadRadius: 1.0,
        ),
        //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ) //BoxShadoww
      ],
    ),
  );
}
