import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductParfum.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/ScreenVeiwParfum.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/routes/order_Screen/notifecationParfumSlider.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';

class PartyParfum extends StatefulWidget {
  PartyParfum({Key? key}) : super(key: key);

  @override
  State<PartyParfum> createState() => PartyParfumState();
}

List listProductParfums = [];
List oLdlistProductParfums = [];

class PartyParfumState extends State<PartyParfum> {
  final TextEditingController _controllerSearch = TextEditingController();
  final TextEditingController controllerTextMoaeny = TextEditingController();
  final TextEditingController controllerTextMlCount = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getDate();
    ladingParfumScreen = false;

    super.initState();
  }

  getDate() async {
    setState(() {
      listProductParfums.clear();
      GetslistProductParfums.clear();
    });

    await getProductParfum();

    setState(() {
      //forEach
      GetslistProductParfums.forEach((element) {
        listProductParfums.add(element);
        oLdlistProductParfums.add(element);
      });
      //
    });
  }

  //
  filterList() {
    var OLdlistProductParfums = listProductParfums.clear();
    if (varibalChangeChoesCondistionParfum == 'All') {
      print(
          "1======================================================================");

      print(GetslistProductParfums.length);
      print(listProductParfums.length);
      print(
          "1======================================================================");

      GetslistProductParfums.forEach((element) {
        listProductParfums.add(element);
        oLdlistProductParfums.add(element);
      });

      print(
          "2======================================================================");

      print(GetslistProductParfums.length);
      print(listProductParfums.length);
      print(
          "2======================================================================");
    } else {
      print(
          "3======================================================================");

      print(GetslistProductParfums.length);
      print(listProductParfums.length);
      print(
          "3======================================================================");

      listProductParfums = GetslistProductParfums.where((element) =>
          element['FullCondistion']
              .contains(varibalChangeChoesCondistionParfum)).toList();

      oLdlistProductParfums = GetslistProductParfums.where((element) =>
          element['FullCondistion']
              .contains(varibalChangeChoesCondistionParfum)).toList();
      print(
          "4======================================================================");

      print(GetslistProductParfums.length);
      print(listProductParfums.length);
      print(
          "4======================================================================");
    }
  }

  //
  updateList() {
    listProductParfums.clear();
    setState(() {
      oLdlistProductParfums.forEach((element) {
        listProductParfums.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ladingParfumScreen == false
            ? LadingAnmation()
            : Column(
                children: [
                  //bar search
                  Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: CustomTextFormField(
                      controller: _controllerSearch,
                      hintText: "enter nom de parfum ou le code Barre",
                      prefixIcon: Icon(
                        Icons.search,
                        color: colorGray,
                      ),
                      suffexIcon: IconButton(
                        onPressed: () async {
                          tapButton1();
                          _controllerSearch.text = await scanBarCode();
                        },
                        icon: Icon(
                          Icons.qr_code_scanner_rounded,
                          color: colorGray,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          listProductParfums.clear();
                          List searchList =
                              oLdlistProductParfums.where((element) {
                            String intituleParfum = element['intituleParfum'];

                            String referenceCodeBar =
                                element['referenceCodeBar'];

                            String varSearch =
                                "$intituleParfum   $referenceCodeBar"
                                    .toLowerCase();

                            return varSearch
                                .contains(value.toString().toLowerCase());
                          }).toList();

                          searchList.forEach((element) {
                            listProductParfums.add(element);
                          });
                          print("===========================================");

                          print(listProductParfums.length);
                          print(oLdlistProductParfums.length);

                          print(searchList.length);

                          print("===========================================");
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //bar choes parfum
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WidgetButtonChoesCondistion(
                            colorActive: blueColor,
                            colorDesctive: colorIcon,
                            onTap: () {
                              setState(() {
                                varibalChangeChoesCondistionParfum = 'All';
                              });
                              filterList();
                            },
                            titel: 'All',
                            value: 'All',
                            varibalChange: varibalChangeChoesCondistionParfum),
                        WidgetButtonChoesCondistion(
                            colorActive: greenColor,
                            colorDesctive: colorIcon,
                            onTap: () {
                              setState(() {
                                varibalChangeChoesCondistionParfum = 'Full';
                              });
                              filterList();
                            },
                            titel: 'Full',
                            value: 'Full',
                            varibalChange: varibalChangeChoesCondistionParfum),
                        WidgetButtonChoesCondistion(
                            colorActive: orgneColor,
                            colorDesctive: colorIcon,
                            onTap: () {
                              setState(() {
                                varibalChangeChoesCondistionParfum = 'Half';
                              });
                              filterList();
                            },
                            titel: 'Half',
                            value: 'Half',
                            varibalChange: varibalChangeChoesCondistionParfum),
                      ],
                    ),
                  ),
                  //
                  Expanded(
                    //height: 500,
                    child: listProductParfums.length == 0
                        ? Center(child: Text("pas de résultat trouvé"))
                        : ListView.builder(
                            itemCount: listProductParfums.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  tapButton2();
                                  controllerTextMoaeny.clear();
                                  controllerTextMlCount.clear();
                                  if (listProductParfums[index]
                                          ['QuantiteNow'] !=
                                      0) {
                                    NotifecationParfumSlider(
                                      context,
                                      itemId: listProductParfums[index]
                                          ['itemId'],
                                      UrlImages: listProductParfums[index]
                                          ['UrlImages'],
                                      intituleParfum: listProductParfums[index]
                                          ['intituleParfum'],
                                      QuantiteInitiale:
                                          listProductParfums[index]
                                              ['QuantiteInitiale'],
                                      QuantiteNow: listProductParfums[index]
                                          ['QuantiteNow'],
                                      dataEntree: listProductParfums[index]
                                          ['dataEntree'],
                                      FullCondistion: listProductParfums[index]
                                          ['FullCondistion'],
                                      PrixDeLunite: listProductParfums[index]
                                          ['PrixDeLunite'],
                                      PrixDeVente: listProductParfums[index]
                                          ['PrixDeVente'],
                                      indexItem: index,
                                      controllerTextMoaeny:
                                          controllerTextMoaeny,
                                      controllerTextMlCount:
                                          controllerTextMlCount,
                                    );
                                  } else {
                                    AwesomeDialog(
                                      //   useRootNavigator: false,
                                      context: context,
                                      title: "warning",
                                      desc: "la boite est vide",
                                      btnOkOnPress: () {},
                                      btnCancelOnPress: () {},

                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                    )..show();
                                  }
                                },
                                child: widgetVeiwProductParfum(
                                  UrlImages: listProductParfums[index]
                                      ['UrlImages'],
                                  intituleParfum: listProductParfums[index]
                                      ['intituleParfum'],
                                  QuantiteInitiale: listProductParfums[index]
                                      ['QuantiteInitiale'],
                                  QuantiteNow: listProductParfums[index]
                                      ['QuantiteNow'],
                                  dataEntree: listProductParfums[index]
                                      ['dataEntree'],
                                  FullCondistion: listProductParfums[index]
                                      ['FullCondistion'],
                                  PrixDeLunite: listProductParfums[index]
                                      ['PrixDeLunite'],
                                ),
                              );
                            }),
                  )
                ],
              ));
  }
}
