import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductParfum.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/ScreenVeiwParfum.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/NotificationConfirmDelegetParufam.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';

class ParfumScreen extends StatefulWidget {
  ParfumScreen({Key? key}) : super(key: key);

  @override
  State<ParfumScreen> createState() => ParfumScreenState();
}

List listProductParfums = [];
List oLdlistProductParfums = [];

class ParfumScreenState extends State<ParfumScreen> {
  final TextEditingController _controllerSearch = TextEditingController();
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
    return WillPopScope(
      onWillPop: () async {
        tapButton1();
        Navigator.of(context).pushReplacementNamed('product Screen');
        return false;
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              tapButton1();
              Navigator.of(context).pushReplacementNamed('Add Parfum Screen');
            },
            backgroundColor: greenColor,
            child: Icon(Icons.add),
          ),
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
                          .pushReplacementNamed('product Screen');
                    },
                    icon: Icon(Icons.arrow_back)),
                Text("parfum"),
                Text("      ")
              ],
            ),
          ),
          body: ladingParfumScreen == false
              ? LadingAnmation()
              : Column(
                  children: [
                    //bar search
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          //ifs select change shadow color
                          color: Color.fromARGB(255, 90, 80, 80),
                          offset: const Offset(
                            0.0,
                            1.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                      child: CustomTextFormField(
                        controller: _controllerSearch,
                        hintText: "enter nom ou code Barre du parfum",
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
                            print(
                                "===========================================");

                            print(listProductParfums.length);
                            print(oLdlistProductParfums.length);

                            print(searchList.length);

                            print(
                                "===========================================");
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              varibalChange:
                                  varibalChangeChoesCondistionParfum),
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
                              varibalChange:
                                  varibalChangeChoesCondistionParfum),
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
                              varibalChange:
                                  varibalChangeChoesCondistionParfum),
                          WidgetButtonChoesCondistion(
                              colorActive: redColor,
                              colorDesctive: colorIcon,
                              onTap: () {
                                setState(() {
                                  varibalChangeChoesCondistionParfum = 'Finsh';
                                });
                                filterList();
                              },
                              titel: 'Finsh',
                              value: 'Finsh',
                              varibalChange:
                                  varibalChangeChoesCondistionParfum),
                        ],
                      ),
                    ),
                    //
                    Expanded(
                      //height: 500,
                      child: listProductParfums.length == 0
                          ? Center(child: Text("pas de resultat trouvé"))
                          : ListView.builder(
                              itemCount: listProductParfums.length,
                              itemBuilder: (context, index) {
                                return // (nameUser != "mohib")
                                    Dismissible(
                                  confirmDismiss: (direction) async {
                                    DismissDirection.down;

                                    NotificationConfirmDelegetProducarfum(
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
                                      indexItem: index,
                                    );
                                  },
                                  onResize: () {},
                                  key: Key('$index'),
                                  background: Container(),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: nameUser == "mohib"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.delete,
                                                    color: Colors.white),
                                                Text('Moov to trash',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            )
                                          : null,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      itemId_VeiwParfum =
                                          listProductParfums[index]['itemId'];

                                      UrlImages_VeiwParfum =
                                          listProductParfums[index]
                                              ['UrlImages'];
                                      intituleParfum_VeiwParfum =
                                          listProductParfums[index]
                                              ['intituleParfum'];
                                      QuantiteNow_VeiwParfum =
                                          listProductParfums[index]
                                              ['QuantiteNow'];
                                      QuantiteInitiale_VeiwParfum =
                                          listProductParfums[index]
                                              ['QuantiteInitiale'];
                                      FullCondistion_VeiwParfum =
                                          listProductParfums[index]
                                              ['FullCondistion'];
                                      dataEntree_VeiwParfum =
                                          listProductParfums[index]
                                              ['dataEntree'];
                                      PrixDeLunite_VeiwParfum =
                                          listProductParfums[index]
                                              ['PrixDeLunite'];
                                      reference_VeiwParfum =
                                          listProductParfums[index]
                                              ['referenceCodeBar'];
                                      PrixDachat_VeiwParfum =
                                          listProductParfums[index]
                                              ['PrixDachat'];
                                      PrixDeVente_VeiwParfum =
                                          listProductParfums[index]
                                              ['PrixDeVente'];
                                      tapButton2();
                                      Navigator.of(context)
                                          .pushNamed("Screen Veiw Item Parfum");
                                    },
                                    child: widgetVeiwProductParfum(
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
                                    ),
                                  ),
                                );
                              }),
                    )
                  ],
                )),
    );
  }
}
