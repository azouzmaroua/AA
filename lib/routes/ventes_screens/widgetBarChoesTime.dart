import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class WidgetBarChoesTime extends StatefulWidget {
  WidgetBarChoesTime({Key? key}) : super(key: key);

  @override
  State<WidgetBarChoesTime> createState() => WidgetBarChoesTimeState();
}

DateTime choesTime1 = DateTime.now();
bool choesTime1Bool = false;
DateTime choesTime2 = DateTime.now();
bool choesTime2Bool = false;

class WidgetBarChoesTimeState extends State<WidgetBarChoesTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              activeWidget();
              //

              await showDatePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime(DateTime.now().year + 10),
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
                    TextColor: choesTime1Bool == true ? blueColor : colorGray,
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
                    TextColor: choesTime2Bool == true ? blueColor : colorGray,
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
              Navigator.of(context)
                  .pushReplacementNamed('Screen filter Statics');
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
    );
  }
}
