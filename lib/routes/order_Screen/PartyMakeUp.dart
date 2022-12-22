import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductMakeUp.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/order_Screen/notifecationMakeUp&AutreTap.dart';
import 'package:my_parfum/routes/produit_screens/makeUp/NotificationConfirmDelegetMakeUp.dart';
import 'package:my_parfum/routes/produit_screens/makeUp/ScreenVeiwMakeUp.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/NotificationConfirmDelegetParufam.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:my_parfum/widgets/widgetVeiwProductMakeUp_Autre.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';

class PartyMakeUp extends StatefulWidget {
  PartyMakeUp({Key? key}) : super(key: key);

  @override
  State<PartyMakeUp> createState() => PartyMakeUpState();
}

List listProductMakeUp = [];
List oLdlistProductMakeUp = [];

class PartyMakeUpState extends State<PartyMakeUp> {
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getDate();
    ladingMakeUpScreen = false;
    super.initState();
  }

  getDate() async {
    setState(() {
      listProductMakeUp.clear();
      GetslistProductMakeUp.clear();
    });

    await getProductMakeUp();

    setState(() {
      //forEach
      GetslistProductMakeUp.forEach((element) {
        listProductMakeUp.add(element);
        oLdlistProductMakeUp.add(element);
      });
      //
    });
  }

//

  //
  updateList() {
    listProductMakeUp.clear();
    setState(() {
      oLdlistProductMakeUp.forEach((element) {
        listProductMakeUp.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ladingMakeUpScreen == false
            ? LadingAnmation()
            : Column(
                children: [
                  //bar search
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: CustomTextFormField(
                      controller: _controllerSearch,
                      hintText: "enter nom de MakeUp ou code Barre",
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
                          listProductMakeUp.clear();
                          List searchList =
                              oLdlistProductMakeUp.where((element) {
                            String intituleParfum = element['intituleMakeUp'];

                            String referenceCodeBar =
                                element['referenceCodeBar'];

                            String varSearch =
                                "$intituleParfum   $referenceCodeBar"
                                    .toLowerCase();

                            return varSearch
                                .contains(value.toString().toLowerCase());
                          }).toList();

                          searchList.forEach((element) {
                            listProductMakeUp.add(element);
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
                    child: listProductMakeUp.length == 0
                        ? Center(child: Text("pas de resultat trouvé"))
                        : ListView.builder(
                            itemCount: listProductMakeUp.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  tapButton2();
                                  count_peieces = 1;
                                  QuantiteInitialeBarChoesQontity =
                                      listProductMakeUp[index]
                                          ['QuantiteInitiale'];
                                  if (listProductMakeUp[index]
                                          ['QuantiteInitiale'] !=
                                      0) {
                                    NotifecationMakeUpAutreTap(
                                      context,
                                      itemId: listProductMakeUp[index]
                                          ['itemId'],
                                      type_Prodct: listProductMakeUp[index]
                                          ["typeProduct"],
                                      UrlImages: listProductMakeUp[index]
                                          ['UrlImages'],
                                      intituleParfum: listProductMakeUp[index]
                                          ['intituleMakeUp'],
                                      QuantiteInitiale: listProductMakeUp[index]
                                          ['QuantiteInitiale'],
                                      dataEntree: listProductMakeUp[index]
                                          ['dataEntree'],
                                      PrixPrixDachat: listProductMakeUp[index]
                                          ['PrixDachat'],
                                      PrixDeVente: listProductMakeUp[index]
                                          ['PrixDeVente'],
                                      indexItem: index,
                                    );
                                  } else {
                                    AwesomeDialog(
                                      //   useRootNavigator: false,
                                      context: context,
                                      title: "warning",
                                      desc:"ce produit est terminé",
                                      btnOkOnPress: () {},
                                      btnCancelOnPress: () {},

                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                    )..show();
                                  }
                                },
                                child: widgetVeiwProductMakeUp_Autre(
                                  UrlImages: listProductMakeUp[index]
                                      ['UrlImages'],
                                  intituleParfum: listProductMakeUp[index]
                                      ['intituleMakeUp'],
                                  QuantiteInitiale: listProductMakeUp[index]
                                      ['QuantiteInitiale'],
                                  dataEntree: listProductMakeUp[index]
                                      ['dataEntree'],
                                  PrixDeLunite: listProductMakeUp[index]
                                      ['PrixDachat'],
                                ),

                                // widgetVeiwProductParfum(
                                //   UrlImages: listProductMakeUp[index]
                                //       ['UrlImages'],
                                //   intituleParfum: listProductMakeUp[index]
                                //       ['intituleMakeUp'],
                                //   QuantiteInitiale: listProductMakeUp[index]
                                //       ['QuantiteInitiale'],
                                //   QuantiteNow: listProductMakeUp[index]
                                //       ['QuantiteNow'],
                                //   dataEntree: listProductMakeUp[index]
                                //       ['dataEntree'],
                                //   FullCondistion: listProductMakeUp[index]
                                //       ['FullCondistion'],
                                //   PrixDeLunite: listProductMakeUp[index]
                                //       ['PrixDeLunite'],
                                // ),
                              );
                            }),
                  )
                ],
              ));
  }
}
