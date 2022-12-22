import 'package:flutter/material.dart';
import 'package:my_parfum/data/get%20Data/getProductParfum.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/order_Screen/PartyAutre.dart';
import 'package:my_parfum/routes/order_Screen/PartyMakeUp.dart';
import 'package:my_parfum/routes/order_Screen/PartyParfum.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesTime.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/widgets/widgetLadingAnmtion.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
//ChosingProductScreen

class ChosingProductScreen extends StatefulWidget {
  ChosingProductScreen({Key? key}) : super(key: key);

  @override
  State<ChosingProductScreen> createState() => ChosingProductScreenState();
}

int indexPageView = 0;
List listOrder = [];

class ChosingProductScreenState extends State<ChosingProductScreen> {
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  late PageController pageViewControlaer;

  String varibalChangeChoesType = 'parfum';
  void initState() {
    // TODO: implement initState
    indexPageView = 0;
    pageViewControlaer = new PageController(initialPage: indexPageView);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        tapButton1();
        Navigator.of(context).pushReplacementNamed("New Order Screen");
        return true;
      },
      child: Scaffold(
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
                          .pushReplacementNamed('New Order Screen');
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(varibalChangeChoesType),
                Text("     ")
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ////bar choes type
              Container(
                width: 900,
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    //bar choes type parfum
                    Container(
                      padding: EdgeInsets.all(0.5),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetButtonChoesTime(
                              colorActive: blueColor,
                              colorDesctive: colorGray,
                              titel: 'parfum',
                              varibalChange: varibalChangeChoesType,
                              onTap: () {
                                setState(() {
                                  indexPageView = 0;
                                  print(indexPageView);
                                  pageViewControlaer.animateToPage(
                                      indexPageView,
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.ease);
                                  varibalChangeChoesType = 'parfum';
                                });
                              },
                            ),
                            WidgetButtonChoesTime(
                              colorActive: blueColor,
                              colorDesctive: colorGray,
                              titel: 'Maquillage',
                              varibalChange: varibalChangeChoesType,
                              onTap: () {
                                setState(() {
                                  indexPageView = 1;
                                  print(indexPageView);
                                  pageViewControlaer.animateToPage(
                                      indexPageView,
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.ease);
                                  varibalChangeChoesType = 'Maquillage';
                                });
                              },
                            ),
                            WidgetButtonChoesTime(
                              colorActive: blueColor,
                              colorDesctive: colorGray,
                              titel: 'Autre',
                              varibalChange: varibalChangeChoesType,
                              onTap: () {
                                setState(() {
                                  indexPageView = 2;
                                  print(indexPageView);
                                  pageViewControlaer.animateToPage(
                                      indexPageView,
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.ease);
                                  varibalChangeChoesType = 'Autre';
                                });
                              },
                            ),
                          ]),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  //Border size & Colors
                  color: Colors.white,

                  // The BoxShadow

                  boxShadow: [
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
                    //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ) //BoxShadow
                  ],
                ),
              ),
              //pagVeiw
              Expanded(
                child: PageView(
                    controller: pageViewControlaer,
                    onPageChanged: (index) {
                      setState(() {
                        indexPageView = index;
                        pageViewControlaer.jumpToPage(index);
                        if (index == 0) {
                          varibalChangeChoesType = 'parfum';

                          //Navigator.of(context).pushReplacementNamed('home Screen');
                        } else if (index == 1) {
                          varibalChangeChoesType = 'Maquillage';

                          //Navigator.of(context).pushReplacementNamed('ventes Screen');
                        } else if (index == 2) {
                          varibalChangeChoesType = 'Autre';

                          // Navigator.of(context).pushReplacementNamed('product Screen');
                        }
                      });
                    },
                    children: [
                      PartyParfum(),
                      PartyMakeUp(),
                      PartyAutre(),
                    ]),
              ),
            ],
          )),
    );
  }
}











                    // Expanded(
                    //   child: Column(
                    //     children: [
                    //       // text formfeiled
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         color: Colors.white,
                    //         child: CustomTextFormField(
                    //           controller: _controllerSearch,
                    //           hintText: "enter name Maquillage or codeBar",
                    //           prefixIcon: Icon(
                    //             Icons.search,
                    //             color: colorGray,
                    //           ),
                    //           suffexIcon: IconButton(
                    //             onPressed: () async {
                    //               tapButton1();
                    //               _controllerSearch.text = await scanBarCode();
                    //             },
                    //             icon: Icon(
                    //               Icons.qr_code_scanner_rounded,
                    //               color: colorGray,
                    //             ),
                    //           ),
                    //           onChanged: (value) {},
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    











// Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(15),
//                         child: Column(
//                           children: [
//                             // text formfeiled
//                             Container(
//                               color: Colors.white,
//                               child: CustomTextFormField(
//                                 controller: _controllerSearch,
//                                 hintText: "enter name parfum or codeBar",
//                                 prefixIcon: Icon(
//                                   Icons.search,
//                                   color: colorGray,
//                                 ),
//                                 suffexIcon: IconButton(
//                                   onPressed: () async {
//                                     tapButton1();
//                                     _controllerSearch.text =
//                                         await scanBarCode();
//                                   },
//                                   icon: Icon(
//                                     Icons.qr_code_scanner_rounded,
//                                     color: colorGray,
//                                   ),
//                                 ),
//                                 onChanged: (value) {},
//                               ),
//                             ),

//                             SizedBox(
//                               height: 5,
//                             ),
//                             //bar choes type parfum
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   WidgetButtonChoesCondistion(
//                                       colorActive: blueColor,
//                                       colorDesctive: colorIcon,
//                                       onTap: () {
//                                         setState(() {
//                                           varibalChangeChoesCondistionParfum =
//                                               'All';
//                                         });
//                                       },
//                                       titel: 'All',
//                                       value: 'All',
//                                       varibalChange:
//                                           varibalChangeChoesCondistionParfum),
//                                   WidgetButtonChoesCondistion(
//                                       colorActive: greenColor,
//                                       colorDesctive: colorIcon,
//                                       onTap: () {
//                                         setState(() {
//                                           varibalChangeChoesCondistionParfum =
//                                               'Full';
//                                         });
//                                       },
//                                       titel: 'Full',
//                                       value: 'Full',
//                                       varibalChange:
//                                           varibalChangeChoesCondistionParfum),
//                                   WidgetButtonChoesCondistion(
//                                       colorActive: orgneColor,
//                                       colorDesctive: colorIcon,
//                                       onTap: () {
//                                         setState(() {
//                                           varibalChangeChoesCondistionParfum =
//                                               'Half';
//                                         });
//                                       },
//                                       titel: 'Half',
//                                       value: 'Half',
//                                       varibalChange:
//                                           varibalChangeChoesCondistionParfum),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),