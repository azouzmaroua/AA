import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductAutres.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/produit_screens/Autres/NotificationConfirmDelegetAutres.dart';
import 'package:my_parfum/routes/produit_screens/Autres/ScreenVeiwAutres.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/NotificationConfirmDelegetParufam.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/widgets/widgetVeiwProductMakeUp_Autre.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';
import 'package:my_parfum/routes/order_Screen/notifecationMakeUp&AutreTap.dart';

class PartyAutre extends StatefulWidget {
  PartyAutre({Key? key}) : super(key: key);

  @override
  State<PartyAutre> createState() => PartyAutreState();
}

List listProductAutres = [];
List oLdlistProductAutres = [];

class PartyAutreState extends State<PartyAutre> {
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getDate();
    ladingAutresScreen = false;
    super.initState();
  }

  getDate() async {
    setState(() {
      listProductAutres.clear();
      GetslistProductAutres.clear();
    });

    await getProductAutres();

    setState(() {
      //forEach
      GetslistProductAutres.forEach((element) {
        listProductAutres.add(element);
        oLdlistProductAutres.add(element);
      });
      //
    });
  }

//

  //
  updateList() {
    listProductAutres.clear();
    setState(() {
      oLdlistProductAutres.forEach((element) {
        listProductAutres.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ladingAutresScreen == false
            ? LadingAnmation()
            : Column(
                children: [
                  //bar search
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: CustomTextFormField(
                      controller: _controllerSearch,
                      hintText: "enter name Autres or codeBar",
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
                          listProductAutres.clear();
                          List searchList =
                              oLdlistProductAutres.where((element) {
                            String intituleParfum = element['intituleAutres'];

                            String referenceCodeBar =
                                element['referenceCodeBar'];

                            String varSearch =
                                "$intituleParfum   $referenceCodeBar"
                                    .toLowerCase();

                            return varSearch
                                .contains(value.toString().toLowerCase());
                          }).toList();

                          searchList.forEach((element) {
                            listProductAutres.add(element);
                          });
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  Expanded(
                    //height: 500,
                    child: listProductAutres.length == 0
                        ? Center(child: Text("no result found"))
                        : ListView.builder(
                            itemCount: listProductAutres.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  tapButton2();
                                  count_peieces = 1;
                                  QuantiteInitialeBarChoesQontity =
                                      listProductAutres[index]
                                          ['QuantiteInitiale'];

                                  if (listProductAutres[index]
                                          ['QuantiteInitiale'] !=
                                      0) {
                                    NotifecationMakeUpAutreTap(
                                      context,
                                      itemId: listProductAutres[index]
                                          ['itemId'],
                                      type_Prodct: listProductAutres[index]
                                          ["typeProduct"],
                                      UrlImages: listProductAutres[index]
                                          ['UrlImages'],
                                      intituleParfum: listProductAutres[index]
                                          ['intituleAutres'],
                                      QuantiteInitiale: listProductAutres[index]
                                          ['QuantiteInitiale'],
                                      dataEntree: listProductAutres[index]
                                          ['dataEntree'],
                                      PrixPrixDachat: listProductAutres[index]
                                          ['PrixDachat'],
                                      PrixDeVente: listProductAutres[index]
                                          ['PrixDeVente'],
                                      indexItem: index,
                                    );
                                  } else {
                                    AwesomeDialog(
                                      //   useRootNavigator: false,
                                      context: context,
                                      title: "warning",
                                      desc: "هذا العنصر انتها من المخزون",
                                      btnOkOnPress: () {},
                                      btnCancelOnPress: () {},

                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                    )..show();
                                  }
                                },
                                child: widgetVeiwProductMakeUp_Autre(
                                  UrlImages: listProductAutres[index]
                                      ['UrlImages'],
                                  intituleParfum: listProductAutres[index]
                                      ['intituleAutres'],
                                  QuantiteInitiale: listProductAutres[index]
                                      ['QuantiteInitiale'],
                                  dataEntree: listProductAutres[index]
                                      ['dataEntree'],
                                  PrixDeLunite: listProductAutres[index]
                                      ['PrixDeVente'],
                                ),
                              );
                            }),
                  )
                ],
              ));
  }
}
