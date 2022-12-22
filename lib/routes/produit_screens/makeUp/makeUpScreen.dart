import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductMakeUp.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
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

class MakeUpScreen extends StatefulWidget {
  MakeUpScreen({Key? key}) : super(key: key);

  @override
  State<MakeUpScreen> createState() => MakeUpScreenState();
}

List listProductMakeUp = [];
List oLdlistProductMakeUp = [];

class MakeUpScreenState extends State<MakeUpScreen> {
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
              Navigator.of(context).pushReplacementNamed('Add MakeUp Screen');
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
                Text("Maquillage"),
                //Text("archiv")
              ],
            ),
          ),
          body: ladingMakeUpScreen == false
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
                          color: Colors.grey,
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
                        hintText: "enter nom ou code Barre de makeup",
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
                          ? Center(child: Text("pas de résultat trouvé"))
                          : ListView.builder(
                              itemCount: listProductMakeUp.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  confirmDismiss: (direction) async {
                                    DismissDirection.down;

                                    NotificationConfirmDelegetMakeUp(
                                      context,
                                      itemId: listProductMakeUp[index]
                                          ['itemId'],
                                      UrlImages: listProductMakeUp[index]
                                          ['UrlImages'],
                                      intituleParfum: listProductMakeUp[index]
                                          ['intituleMakeUp'],
                                      QuantiteInitiale: listProductMakeUp[index]
                                          ['QuantiteInitiale'],
                                      dataEntree: listProductMakeUp[index]
                                          ['dataEntree'],
                                      PrixDeLunite: listProductMakeUp[index]
                                          ['PrixDeVente'],
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Move to trash',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      itemId_VeiwMakeUp =
                                          listProductMakeUp[index]['itemId'];

                                      UrlImages_VeiwMakeUp =
                                          listProductMakeUp[index]['UrlImages'];

                                      intituleMakeUp_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['intituleMakeUp'];

                                      QuantiteInitiale_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['QuantiteInitiale'];

                                      dataEntree_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['dataEntree'];

                                      reference_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['referenceCodeBar'];

                                      PrixDachat_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['PrixDachat'];
                                      PrixDeVente_VeiwMakeUp =
                                          listProductMakeUp[index]
                                              ['PrixDeVente'];

                                      tapButton2();
                                      Navigator.of(context)
                                          .pushNamed("Screen Veiw Item MakeUp");
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
                                  ),
                                );
                              }),
                    )
                  ],
                )),
    );
  }
}
