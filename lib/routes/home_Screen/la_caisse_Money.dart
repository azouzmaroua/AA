import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';

class La_case_Moeny extends StatefulWidget {
  La_case_Moeny({Key? key}) : super(key: key);

  @override
  State<La_case_Moeny> createState() => _La_case_MoenyState();
}

class _La_case_MoenyState extends State<La_case_Moeny> {
  @override
  TextEditingController textFormFeild = new TextEditingController();
  TextEditingController cause = new TextEditingController();
  bool view_screen = false;

  void initState() {
    // TODO: implement
    getTime();
    getData();
    super.initState();
  }

// 1 first / get time
  DateTime dataEntreeGet = DateTime.now();

  getTime() async {
    dataEntreeGet = await getTime();
    String dataEntree = '$dataEntreeGet';
    dataEntree = dataEntree.substring(0, 10);
  }

  //
  List historic_lacase = [];
  num Moeny_On_la_case = 0;

  Future getData() async {
    var refranceCase =
        FirebaseFirestore.instance.collection("users").doc("la_case");
    refranceCase.get().then((value) {
      var dataCase = value.data();
      setState(() {
        Moeny_On_la_case = dataCase!['Moeny_On_la_case'];
      });

      List getData = dataCase!['Historic_lacase'];
      List x = getData.reversed.toList();
      getData.clear();
      getData = x;
      getData.forEach((element) {
        setState(() {
          historic_lacase.add(element);
        });
      });
    });

    // //قلب ليست
    // setState(() {
    //   List x =  historic_lacase.reversed.toList();
    //   ;
    //   historic_lacase.clear();
    //   historic_lacase = x;
    // });
  }

  Widget build(BuildContext context) {
    String CodeApp = "773377";
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            tapButton1();
            Navigator.of(context).pushNamed("User Screen");
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.person),
        ),
        appBar: AppBar(
          title: Text("la caisse"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: view_screen == true
            ? Column(
                children: [
                  //

                  //
                  SizedBox(height: 20),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "$Moeny_On_la_case",
                            TextSize: 28,
                            TextWeight: FontWeight.bold,
                            TextColor: Colors.black),
                        CustomText(
                            text: "   DA",
                            TextSize: 31,
                            TextWeight: FontWeight.bold,
                            TextColor: Colors.black),
                      ],
                    ),
                    width: 500,
                    height: 90,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //Border size & Colors

                      border: Border.all(
                          color: Color.fromARGB(255, 199, 224, 199),
                          width: 3.0,
                          style: BorderStyle.solid), //Border.all

                      //BorderRadius

                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      SizedBox(width: 15),
                      CustomText(
                        text: "La cause :",
                        TextSize: 22,
                        TextWeight: FontWeight.bold,
                        TextColor: Color.fromARGB(255, 131, 130, 130),
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 210,
                        height: 50,
                        margin: EdgeInsets.all(0),
                        child: TextFormField(
                          controller: cause,
                          keyboardType: TextInputType.text,
                          onChanged: (v) {},
                          onSaved: (ve) {},
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCCCCCC),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: textFormFeild,
                          keyboardType: TextInputType.number,
                          onChanged: (v) {},
                          onSaved: (ve) {},
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "DA",
                                  TextSize: 21,
                                  TextColor: Color.fromARGB(255, 131, 130, 130),
                                  TextWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCCCCCC),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            tapButton1();

                            var refranceCase =
                                FirebaseFirestore.instance.collection("users");

                            refranceCase.doc("la_case").update({
                              "Moeny_On_la_case": FieldValue.increment(
                                  num.parse(textFormFeild.text)),
                              "Historic_lacase": FieldValue.arrayUnion([
                                {
                                  "timeEnterExsaktli": dataEntreeGet,
                                  "name_Adder": "$nameUser",
                                  "price": num.parse(textFormFeild.text),
                                  "type": "add",
                                  "cause": cause.text,
                                }
                              ])
                            });
                            //
                            historic_lacase.clear();
                            getData();
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              //Border size & Colors
                              color: Color.fromARGB(236, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(),
                              ],
                              //BorderRadius

                              borderRadius: BorderRadius.circular(10),

                              // The BoxShadow
                            ), //BoxD
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            tapButton1();
                            var refranceCase =
                                FirebaseFirestore.instance.collection("users");

                            refranceCase.doc("la_case").update({
                              "Moeny_On_la_case": FieldValue.increment(
                                  -num.parse(textFormFeild.text)),
                              "Historic_lacase": FieldValue.arrayUnion([
                                {
                                  "timeEnterExsaktli": dataEntreeGet,
                                  "name_Adder": "$nameUser",
                                  "price": num.parse(textFormFeild.text),
                                  "type": "minus",
                                  "cause": cause.text,
                                }
                              ])
                            });
                            historic_lacase.clear();

                            //
                            getData();
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 30,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              //Border size & Colors
                              color: Color.fromARGB(236, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(),
                              ],
                              //BorderRadius

                              borderRadius: BorderRadius.circular(10),

                              // The BoxShadow
                            ), //BoxD
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: historic_lacase.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(12),
                            height: 110,
                            width: 200,
                            color: historic_lacase[index]['type'] == 'add'
                                ? Color.fromARGB(255, 50, 168, 82)
                                : Color.fromARGB(255, 222, 73, 51),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: DateTime.parse(
                                              historic_lacase[index]
                                                      ['timeEnterExsaktli']
                                                  .toDate()
                                                  .toString())
                                          .toString()
                                          .substring(0, 19),
                                      TextSize: 18,
                                      TextWeight: FontWeight.normal,
                                      TextColor:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  CustomText(
                                      text:
                                          "${historic_lacase[index]['name_Adder']}",
                                      TextSize: 18,
                                      TextWeight: FontWeight.normal,
                                      TextColor:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  CustomText(
                                      text:
                                          "${historic_lacase[index]['price']} Da",
                                      TextSize: 18,
                                      TextWeight: FontWeight.normal,
                                      TextColor:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  CustomText(
                                      text:
                                          "cause : ${historic_lacase[index]['cause']}",
                                      TextSize: 18,
                                      TextWeight: FontWeight.normal,
                                      TextColor:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ]),
                          );
                        }),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'enter Code',
                      TextSize: 23,
                      TextColor: Colors.black,
                      TextWeight: FontWeight.bold),
                  //text form feiled
                  Container(
                    width: 500,
                    height: 80,
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: textFormFeild,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {},
                      onSaved: (ve) {},
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            )),
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: 195,
                    height: 50,
                    child: CustomGeneralButton(
                      color: greenColor,
                      text: 'confirm',
                      onTap: () {
                        if (textFormFeild.text == CodeApp) {
                          setState(() {
                            view_screen = true;
                            getTime();
                            getData();
                          });
                        } else {
                          AwesomeDialog(
                            //   useRootNavigator: false,
                            context: context,
                            title: "Error",
                            desc: "the code is false",
                            btnOkOnPress: () {},
                            btnCancelOnPress: () {},

                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                          )..show();
                        }
                      },
                    ),
                  ),
                ],
              ));
  }
}
