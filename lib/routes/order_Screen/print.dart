import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:my_parfum/data/addOrders.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/routes/order_Screen/ImagestorByte.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'dart:io';

import 'package:my_parfum/routes/order_Screen/printer.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:screenshot/screenshot.dart';

class Printers extends StatefulWidget {
  const Printers({Key? key}) : super(key: key);

  @override
  State<Printers> createState() => _PrintersState();
}

class _PrintersState extends State<Printers> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage2(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(dir);
    // setState(() {
    //   Process.run('$dir/images/installerX64/install.exe', [' start '])
    //       .then((ProcessResult results) {
    //     print(results.stdout);
    //   });
    // });
  }

  void testPrint(String printerIp, Uint8List theimageThatComesfr) async {
    print("im inside the test print 2");
    // TODO Don't forget to choose printer's paper size
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);

    final PosPrintResult res = await printer.connect(printerIp, port: 9100);

    if (res == PosPrintResult.success) {
      // DEMO RECEIPT
      await testReceipt(printer, theimageThatComesfr);
      print(res.msg);
      await Future.delayed(const Duration(seconds: 3), () {
        print("prinnter desconect");
        printer.disconnect();
      });
    }
  }

  TextEditingController Printer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          tapButton1();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Home();
          }));
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("verification"),
              ],
            ),
          ),
          body: Center(
              child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'imprimer',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      screenshotController
                          .capture(delay: const Duration(milliseconds: 10))
                          .then((capturedImage) async {
                        theimageThatComesfromThePrinter = capturedImage!;
                        setState(() {
                          theimageThatComesfromThePrinter = capturedImage;
                          testPrint(
                              "192.168.1.100", theimageThatComesfromThePrinter);
                        });
                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Image.asset(
                              "images/h.png",
                              height: 150,
                            ),
                            CustomText(
                              text: '-------------------------------------',
                              TextSize: 25,
                              TextColor: Color.fromARGB(255, 7, 7, 7),
                              TextWeight: FontWeight.w300,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  //

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: 'N°$numberOrder',
                                        TextSize: 18,
                                        TextColor: colorGray,
                                        TextWeight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        text: dataEntreOrder
                                            .toString()
                                            .substring(0, 19),
                                        TextSize: 12,
                                        TextColor: Colors.black,
                                        TextWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                  //
                                  CustomText(
                                    text:
                                        '-------------------------------------',
                                    TextSize: 25,
                                    TextColor: Color.fromARGB(255, 7, 7, 7),
                                    TextWeight: FontWeight.w300,
                                  ),

                                  //
                                  SizedBox(
                                    height: 70 *
                                        double.parse("${listOrder.length}"),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: listOrder.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text: listOrder[index]
                                                        ["nameProduct"],
                                                    TextSize: 14,
                                                    TextColor: Colors.black,
                                                    TextWeight: FontWeight.w500,
                                                  ),
                                                  CustomText(
                                                    text: listOrder[index]
                                                        ["type_Prodct"],
                                                    TextSize: 14,
                                                    TextColor: Colors.black,
                                                    TextWeight: FontWeight.w200,
                                                  ),
                                                ],
                                              ),
                                              CustomText(
                                                text: listOrder[index]
                                                            ["type_Prodct"] ==
                                                        "Parfum"
                                                    ? listOrder[index]
                                                                ["count_ml"]
                                                            .toString() +
                                                        " ml"
                                                    : listOrder[index][
                                                                "count_peieces"]
                                                            .toString() +
                                                        " peieces".toString(),
                                                TextSize: 14,
                                                TextColor: Colors.black,
                                                TextWeight: FontWeight.w600,
                                              ),
                                              CustomText(
                                                text: listOrder[index]["price"]
                                                        .toString() +
                                                    " DA",
                                                TextSize: 14,
                                                TextColor: Colors.black,
                                                TextWeight: FontWeight.w600,
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                  //

                                  //
                                  CustomText(
                                    text:
                                        '-------------------------------------',
                                    TextSize: 25,
                                    TextColor: Color.fromARGB(255, 7, 7, 7),
                                    TextWeight: FontWeight.w300,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: 'Total',
                                        TextSize: 18,
                                        TextColor: colorGray,
                                        TextWeight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        text: '$totalPrice DA',
                                        TextSize: 18,
                                        TextColor: Colors.black,
                                        TextWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text:
                                        '-------------------------------------',
                                    TextSize: 25,
                                    TextColor: Color.fromARGB(255, 7, 7, 7),
                                    TextWeight: FontWeight.w300,
                                  ),
                                  //
                                  Image.asset(
                                    "images/f.png",
                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 700,
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: CustomGeneralButton(
                      color: greenColor,
                      text: 'confirmer',
                      onTap: () {
                        tapButton1();
                        listOrder.clear();
                        //indexPageView = 2;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
        ));
  }
}
