import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_parfum/data/addOrders.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

import 'package:image/image.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class SuccesOrder extends StatefulWidget {
  SuccesOrder({Key? key}) : super(key: key);

  @override
  State<SuccesOrder> createState() => _SuccesOrderState();
}

class _SuccesOrderState extends State<SuccesOrder> {
  void testReceipt(NetworkPrinter printer) async {
    printer.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
        styles: PosStyles(codeTable: 'CP1252'));
    printer.text('Special 2: blåbærgrød',
        styles: PosStyles(codeTable: 'CP1252'));

    printer.text('Bold text', styles: PosStyles(bold: true));
    printer.text('Reverse text', styles: PosStyles(reverse: true));
    printer.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    printer.text('Align left', styles: PosStyles(align: PosAlign.left));
    printer.text('Align center', styles: PosStyles(align: PosAlign.center));
    printer.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    printer.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    printer.feed(2);
    printer.cut();
  }

  void printer() async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);

    final PosPrintResult res =
        await printer.connect('192.168.1.100', port: 9100);

    if (res == PosPrintResult.success) {
      testReceipt(printer);
      printer.disconnect();
    }

    print('Print result: ${res.msg}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //print ticket
            //#####################################################################

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomText(
                    text: '----------------------------------------',
                    TextSize: 21,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: 'N°$numberOrder',
                        TextSize: 18,
                        TextColor: colorGray,
                        TextWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: dataEntreOrder.toString().substring(0, 19),
                        TextSize: 16,
                        TextColor: Colors.black,
                        TextWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  //

                  //
                  SizedBox(
                    height: 70 * double.parse("${listOrder.length}"),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listOrder.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: listOrder[index]["nameProduct"],
                                    TextSize: 21,
                                    TextColor: Colors.black,
                                    TextWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: listOrder[index]["type_Prodct"],
                                    TextSize: 15,
                                    TextColor: Colors.black,
                                    TextWeight: FontWeight.w200,
                                  ),
                                ],
                              ),
                              CustomText(
                                text: listOrder[index]["type_Prodct"] ==
                                        "Parfum"
                                    ? listOrder[index]["count_ml"].toString() +
                                        " ml"
                                    : listOrder[index]["count_peieces"]
                                            .toString() +
                                        " peieces".toString(),
                                TextSize: 19,
                                TextColor: Colors.black,
                                TextWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: listOrder[index]["price"].toString() +
                                    " DA",
                                TextSize: 19,
                                TextColor: Colors.black,
                                TextWeight: FontWeight.w600,
                              ),
                            ],
                          );
                        }),
                  ),
                  //
                  Text('----------------------------------------',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  //

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  //

                  CustomText(
                    text: '----------------------------------------',
                    TextSize: 21,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),

            //#####################################################################
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: greenColor,
            ),
            CustomText(
              text: 'Command N$numberOrder a été',
              TextSize: 21,
              TextColor: greenColor,
              TextWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Enregistrer avec succés',
              TextSize: 21,
              TextColor: greenColor,
              TextWeight: FontWeight.bold,
            ),
            Container(
              width: 700,
              height: 50,
              margin: EdgeInsets.all(20),
              child: CustomGeneralButton(
                color: blueColor,
                text: "imprimer l'étiquette",
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("print");

                  // printer();
                },
              ),
            ),
            //button green
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
                  indexPageView = 2;
                  Navigator.of(context).pushReplacementNamed('home Screen');
                },
              ),
            ),
          ]),
    );
  }
}
