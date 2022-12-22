import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/data/get%20Data/getImagesParfum.dart';
import 'package:my_parfum/data/get%20Data/getProductParfum.dart';
import 'package:my_parfum/data/add%20Data/uplodImages.dart';
// import 'package:my_parfum/data/uplodImages.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/functions/getTime.dart';
import 'package:my_parfum/functions/CreatCodeOrder.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_dropDown_time.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_scrol_monthes_button.dart';
import 'package:my_parfum/routes/ventes_screens/widgetDropBar.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/test/widgetChart.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/buttons/WidgetButtonChoesCondistion.dart';
import 'package:my_parfum/widgets/bottomSheet/choesEnterOrderBottomSheet.dart';
import 'package:my_parfum/widgets/bottomSheet/choesImageBottomSheet.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/widgets/custom/text_field__item.dart';
import 'package:my_parfum/widgets/notification/NotificationLading.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class Test5 extends StatefulWidget {
  Test5({Key? key}) : super(key: key);

  @override
  State<Test5> createState() => _Test5State();
}

bool xQ = false;
List getItems = [];

class _Test5State extends State<Test5> {
  @override
  late DateTime pickedDate;
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  DateTime choesTime1 = DateTime.now();
  bool choesTime1Bool = false;
  DateTime choesTime2 = DateTime.now();
  bool choesTime2Bool = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    activeWidget();
                    //

                    await showDatePicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(DateTime.now().year + 5),
                      initialDate: DateTime.now(),
                    ).then((value) {
                      setState(() {
                        choesTime1 = value!;
                        choesTime1Bool = true;
                      });
                    });
                  },
                  child: Container(
                    //   width: 60,
                    height: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //Border size & Colors
                      border: Border.all(
                          color: choesTime1Bool == true ? blueColor : colorGray,
                          width: 2.0,
                          style: BorderStyle.solid), //Border.all

                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "De",
                          TextSize: 15,
                          TextColor: Colors.grey,
                          TextWeight: FontWeight.w600,
                        ),
                        Visibility(
                          visible: choesTime1Bool,
                          child: CustomText(
                            text: choesTime1.toString().substring(0, 10),
                            TextSize: 15,
                            TextColor: blueColor,
                            TextWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    activeWidget();
                    //

                    await showDatePicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(DateTime.now().year + 5),
                      initialDate: DateTime.now(),
                    ).then((value) {
                      setState(() {
                        choesTime2 = value!;
                        choesTime2Bool = true;
                      });
                    });
                  },
                  child: Container(
                    //   width: 60,
                    height: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //Border size & Colors
                      border: Border.all(
                          color: choesTime2Bool == true ? blueColor : colorGray,
                          width: 2.0,
                          style: BorderStyle.solid), //Border.all

                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "jusqu'à",
                          TextSize: 15,
                          TextColor:
                              choesTime2Bool == true ? blueColor : colorGray,
                          TextWeight: FontWeight.w600,
                        ),
                        Visibility(
                          visible: choesTime2Bool,
                          child: CustomText(
                            text: choesTime2.toString().substring(0, 10),
                            TextSize: 15,
                            TextColor: blueColor,
                            TextWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  activeWidget();
                  if ((choesTime1.isBefore(choesTime2) == true) &&
                      (choesTime1Bool && choesTime2Bool == true)) {
                    print("=========================================");
                    print("succse");
                  } else {
                    //
                    print("=========================================");
                    print("erorer");
                  }
                },
                child: Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: choesTime1Bool && choesTime2Bool == true
                        ? blueColor
                        : colorGray,
                    //Border size & Colors
                    border: Border.all(
                        color: choesTime1Bool && choesTime2Bool == true
                            ? blueColor
                            : colorGray,
                        width: 2.0,
                        style: BorderStyle.solid), //Border.all

                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.search,
                    size: 34,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),

          Row(
            children: [
              //
              Container(
                width: 120,
                height: 40,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  //Border size & Colors

                  border: Border.all(
                      color: blueColor,
                      width: 2.0,
                      style: BorderStyle.solid), //Border.all

                  //BorderRadius

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValueMonth,
                    icon: const Icon(Icons.arrow_drop_down,
                        size: 25, color: Colors.black),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        activeButtonMonth = listMonth.indexOf("$value");
                        dropdownValueMonth = value!;
                        print("=========================================");

                        print(activeButtonMonth);
                      });
                    },
                    items:
                        listMonth.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          "${value}",
                          style: TextStyle(
                              color: Colors.black,
                              // Color(0xffa5a5a3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              //
              //
              Container(
                width: 120,
                height: 40,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  //Border size & Colors

                  border: Border.all(
                      color: blueColor,
                      width: 2.0,
                      style: BorderStyle.solid), //Border.all

                  //BorderRadius

                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValueYear,
                    icon: const Icon(Icons.arrow_drop_down,
                        size: 25, color: Colors.black),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValueYear = value!;
                        print("=========================================");

                        print(activeButtonMonth);
                      });
                    },
                    items:
                        listYear.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          "${value}",
                          style: TextStyle(
                              color: Colors.black,
                              // Color(0xffa5a5a3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              //
            ],
          ), //

          Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        activeWidget();
                        setState(() {
                          dropdownValueMonth = listMonth[index];
                          activeButtonMonth = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 70 + 10,
                        child: Column(
                          children: [
                            Text(
                              "${listMonth[index]}",
                              style: TextStyle(
                                  color: Colors.black,
                                  // Color(0xffa5a5a3),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 60 + 10 + 10,
                              height: 5,
                              color: activeButtonMonth == index
                                  ? blueColor
                                  : Color.fromARGB(0, 255, 255, 255),
                            ))
                          ],
                        ),
                      ),
                    );
                  })),

          ElevatedButton(
            child: Text("time enter"),
            onPressed: () async {
              await showDatePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDate: DateTime.now(),
              );
            },
          ),
          ElevatedButton(
            child: Text("get"),
            onPressed: () async {
              var refranceOrder =
                  await FirebaseFirestore.instance.collection("xxxxx");
              await refranceOrder.get().then((value) {
                value.docs.forEach((element) {
                  setState(() {
                    getItems.add(element.data());
                  });
                });
                print(getItems);
              });
            },
          ),
          ElevatedButton(
            child: Text("filter"),
            onPressed: () async {
              var refranceOrder =
                  await FirebaseFirestore.instance.collection("xxxxx");
              //"ww", isLessThanOrEqualTo: '2022-11-03'
              await refranceOrder
                  .where("ww", isLessThanOrEqualTo: '2022-11-08')
                  .where("ww", isGreaterThanOrEqualTo: '2022-10-03')
                  .get()
                  .then((value) {
                value.docs.forEach((element) {
                  setState(() {
                    getItems.add(element.data());
                  });
                });
                print(getItems);
              });
            },
          ),
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: getItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Center(
                          child:
                              Text("$index" + "  /  " + getItems[index]['ww'])),
                      color: index.isEven ? Colors.red : Colors.blue,
                      height: 100,
                      width: 100,
                    );
                  }))

          //
        ],
      ),
    );
  }
}

// Container(
//             width: 1000,
//             child:
//                 WidgetChartx(chartData: getChartData(), titel: 'xxxxxxxxxx'))

//=============================================================================

//  AudioPlayer().play(AssetSource('audio/TapButton1.mp3'));

class Test4 extends StatefulWidget {
  Test4({Key? key}) : super(key: key);

  @override
  State<Test4> createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //1
        ElevatedButton(
          child: Text("TapButton1"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/TapButton1.mp3'));
          },
        ),

        //1
        ElevatedButton(
          child: Text("tapButton2"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/tapButton2.mp3'));
          },
        ),

        //1
        ElevatedButton(
          child: Text("activeWidget"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/ActiveWidget.mp3'));
          },
        ),
        SizedBox(
          height: 200,
        ),

        //1
        ElevatedButton(
          child: Text("DeactivateWidget"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/DeactivateWidget.mp3'));
          },
        ),

        //1
        ElevatedButton(
          child: Text("Notification1"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/Notification1.mp3'));
          },
        ),

        //1
        ElevatedButton(
          child: Text("notification2"),
          onPressed: () {
            AudioPlayer().play(AssetSource('audio/notification2.mp3'));
          },
        ),
      ]),
    );
  }
}
//==========================================================================================================

class Test3 extends StatefulWidget {
  Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

String varibalChange = "full";

class _Test3State extends State<Test3> {
  void setState(VoidCallback fn) {
    getDate();
    super.setState(fn);
  }

  getDate() async {
    var x = getProductParfum();
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              getProductParfum();
            },
            child: Text("presd")),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetButtonChoesCondistion(
              colorActive: blueColor,
              colorDesctive: Color.fromARGB(255, 90, 88, 88),
              titel: "full",
              varibalChange: varibalChange,
              onTap: () {},
              value: '',
            ),
            WidgetButtonChoesCondistion(
              colorActive: blueColor,
              colorDesctive: Color.fromARGB(255, 90, 88, 88),
              titel: "full",
              varibalChange: varibalChange,
              onTap: () {},
              value: '',
            ),
            WidgetButtonChoesCondistion(
              colorActive: blueColor,
              colorDesctive: Color.fromARGB(255, 90, 88, 88),
              titel: "full",
              varibalChange: varibalChange,
              onTap: () {},
              value: '',
            ),
            WidgetButtonChoesCondistion(
              colorActive: blueColor,
              colorDesctive: Color.fromARGB(255, 90, 88, 88),
              titel: "full",
              varibalChange: varibalChange,
              onTap: () {},
              value: '',
            ),
          ],
        ),
        // widgetVeiwProductParfum(
        //   UrlImages:
        //       'https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/image_picker8874293783618303752.jpg48402007?alt=media&token=7182d588-743a-4054-a68f-62202533f6f8',
        //   intituleParfum: 'Savege',
        //   QuantiteInitiale: '200',
        //   QuantiteNow: '100',
        //   dataEntree: '2020/12/05',
        //   FullCondistion: "Full",
        //   PrixDeLunite: '150',
        // ),
        // widgetVeiwProductParfum(
        //   UrlImages:
        //       'https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/image_picker8874293783618303752.jpg48402007?alt=media&token=7182d588-743a-4054-a68f-62202533f6f8',
        //   intituleParfum: 'Savege',
        //   QuantiteInitiale: '200',
        //   QuantiteNow: '100',
        //   dataEntree: '2020/12/05',
        //   FullCondistion: "Half",
        //   PrixDeLunite: '150',
        // ),
        // widgetVeiwProductParfum(
        //   UrlImages:
        //       'https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/image_picker8874293783618303752.jpg48402007?alt=media&token=7182d588-743a-4054-a68f-62202533f6f8',
        //   intituleParfum: 'Savege',
        //   QuantiteInitiale: '200',
        //   QuantiteNow: '100',
        //   dataEntree: '2020/12/05',
        //   FullCondistion: "finsh",
        //   PrixDeLunite: '150',
        // ),
      ]),
    );
  }
}

//==========================================================================================================

class Test2 extends StatefulWidget {
  Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<ChoesImageProvide>(builder: ((context, model, child) {
          return InkWell(
              onTap: () {
                // model.changeImage();
                showBottomChoesImage(context, "");
              },
              child: image == null
                  ? SizedBox(
                      height: 200,
                      width: 200,
                      child: Icon(
                        Icons.add_photo_alternate,
                        size: 155,
                      ),
                    )
                  : SizedBox(
                      child: Image.file(image!),
                      height: 200,
                      width: 200,
                    ));
        })),
      ],
    ));
  }
}

//==========================================================================================================

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  getData() async {
    //add id user
    // CollectionReference docCodes =
    //     FirebaseFirestore.instance.collection("users");
    // docCodes.add({"EmailRigesterWithMe": "xxxxx"});
    var x = await creatCodeOrder();
    print("=================");

    print(x);
  }

  final TextEditingController _controllerNameParfum = TextEditingController();

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('Add Parfum Screen');
            },
            backgroundColor: greenColor,
            child: Icon(Icons.add),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Selector<Model, String>(
                  selector: (context, getVar) => getVar.nameSelctore,
                  builder: ((context, model, child) {
                    return Text(("${model}"));
                  })),
              ElevatedButton(
                  onPressed: () {
                    // Model.changeImage();
                    x = "tttttttttttttttttttt";
                  },
                  child: Text("data")),
              Consumer<Model>(builder: ((context, model, child) {
                return Column(
                  children: [
                    Text(("${model.nameX}")),
                    ElevatedButton(
                        onPressed: () {
                          model.changeImage();
                        },
                        child: Text("on presed")),
                  ],
                );
              })),
              SizedBox(
                  child: image == null
                      ? InkWell(
                          onTap: () {
                            showBottomChoesImage(context, "");
                          },
                          child: Icon(
                            Icons.add_photo_alternate,
                            size: 100,
                          ),
                        )
                      : SizedBox(
                          child: Image.file(image!),
                          height: 200,
                          width: 200,
                        )),
              ElevatedButton(
                  child: Text("on pressd"),
                  onPressed: () async {
                    showBottomChoesImage(context, "");
                  }),
              ElevatedButton(
                  child: Text("uplod Image"),
                  onPressed: () async {
                    String urlImageUploding = await uplodImage(image, "");
                    print(
                        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                    print(urlImageUploding);
                    print(
                        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                  }),
              ElevatedButton(
                  child: Text("get urls Images"),
                  onPressed: () async {
                    messageLading(context);
                    //Navigator.of(context).pushNamed('Gallery Images Screen');
                  }),
            ],
          )),
    );
  }
}

// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
String x = "dssssss";

class Model extends ChangeNotifier {
  get nameSelctore => x;
  String nameX = "ddd";
  changeImage() {
    x = "chakib";
    nameX = "xxxxxxxxxxxxxxxxx";
    notifyListeners();
  }
}
