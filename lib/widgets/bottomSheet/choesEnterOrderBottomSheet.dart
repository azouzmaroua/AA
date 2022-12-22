import 'package:flutter/material.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

showBottomChoesOrder(context) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 185,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // titetl bootom sheet
                  CustomText(
                    text: 'choisir comment enter un order',
                    TextSize: 23,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  // 1 image asset
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {
                        tapButton1();
                        Navigator.of(context)
                            .pushNamed("Chosing Product Screen");
                      },
                      child: Row(children: [
                        Icon(
                          // Icons.perm_media_rounded,
                          Icons.filter_list,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            text: 'choisissez un produit par nom ',
                            TextSize: 20,
                            TextColor: Colors.black,
                            TextWeight: FontWeight.w500),
                      ]),
                    ),
                  ),
                  // 2 From gallery
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Row(children: [
                        Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            text: 'choisissez un produit par code barre ',
                            TextSize: 20,
                            TextColor: Colors.black,
                            TextWeight: FontWeight.w500),
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
