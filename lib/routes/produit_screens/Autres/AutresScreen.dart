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

class AutresScreen extends StatefulWidget {
  AutresScreen({Key? key}) : super(key: key);

  @override
  State<AutresScreen> createState() => AutresScreenState();
}

List listProductAutres = [];
List oLdlistProductAutres = [];

class AutresScreenState extends State<AutresScreen> {
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
              Navigator.of(context).pushReplacementNamed('Add Autres Screen');
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
                Text("Autres"),
                //Text("archiv")
              ],
            ),
          ),
          body: ladingAutresScreen == false
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
                        hintText: "enter nom ou code Barre de produit",
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
                          ? Center(child: Text("pas de resultat trouvé"))
                          : ListView.builder(
                              itemCount: listProductAutres.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  confirmDismiss: (direction) async {
                                    DismissDirection.down;

                                    NotificationConfirmDelegetAutres(
                                      context,
                                      itemId: listProductAutres[index]
                                          ['itemId'],
                                      UrlImages: listProductAutres[index]
                                          ['UrlImages'],
                                      intituleAutres: listProductAutres[index]
                                          ['intituleAutres'],
                                      QuantiteInitiale: listProductAutres[index]
                                          ['QuantiteInitiale'],
                                      dataEntree: listProductAutres[index]
                                          ['dataEntree'],
                                      PrixDeLunite: listProductAutres[index]
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
                                      itemId_VeiwAutres =
                                          listProductAutres[index]['itemId'];

                                      UrlImages_VeiwAutres =
                                          listProductAutres[index]['UrlImages'];

                                      intituleAutres_VeiwAutres =
                                          listProductAutres[index]
                                              ['intituleAutres'];

                                      QuantiteInitiale_VeiwAutres =
                                          listProductAutres[index]
                                              ['QuantiteInitiale'];

                                      dataEntree_VeiwAutres =
                                          listProductAutres[index]
                                              ['dataEntree'];

                                      reference_VeiwAutres =
                                          listProductAutres[index]
                                              ['referenceCodeBar'];

                                      PrixDachat_VeiwAutres =
                                          listProductAutres[index]
                                              ['PrixDachat'];
                                      PrixDeVente_VeiwAutres =
                                          listProductAutres[index]
                                              ['PrixDeVente'];

                                      tapButton2();
                                      Navigator.of(context)
                                          .pushNamed("Screen Veiw Item Autres");
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
                                  ),
                                );
                              }),
                    )
                  ],
                )),
    );
  }
}
