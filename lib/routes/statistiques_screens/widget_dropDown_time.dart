import 'package:flutter/material.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_scrol_monthes_button.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

List<String> listYear = <String>[
  "2022",
  "2023",
  "2024",
  "2025",
  "2026",
  "2027",
  "2028",
  "2029",
  "2030",
  "2031",
  "2032",
  "2033"
];

String dropdownValueMonth = "janvier";
String dropdownValueYear = "2022";

class WidgetDropDownMonth extends StatefulWidget {
  WidgetDropDownMonth({Key? key}) : super(key: key);

  @override
  State<WidgetDropDownMonth> createState() => _WidgetDropDownMonthState();
}

class _WidgetDropDownMonthState extends State<WidgetDropDownMonth> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          icon:
              const Icon(Icons.arrow_drop_down, size: 25, color: Colors.black),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          // underline: Container(
          //   height: 2,
          //   color: Colors.deepPurpleAccent,
          // ),
          onChanged: (String? value) {
            setState(() {
              activeButtonMonth = listMonth.indexOf("$value");
              dropdownValueMonth = value!;
            });

            // This is called when the user selects an item.
            // setState(() {
            //   activeButtonMonth = listMonth.indexOf("$value");
            //   dropdownValue = dropdownValueMonth;

            // });
          },
          items: listMonth.map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}

Widget widgetDropDownMonth({
  required Null Function() onChanged,
  required String dropdownValue,
}) {
  return Container(
    width: 120,
    height: 40,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      //Border size & Colors

      border: Border.all(
          color: blueColor, width: 2.0, style: BorderStyle.solid), //Border.all

      //BorderRadius

      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down, size: 25, color: Colors.black),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        // underline: Container(
        //   height: 2,
        //   color: Colors.deepPurpleAccent,
        // ),
        onChanged: (String? value) {
          dropdownValueMonth = value!;
          activeButtonMonth = listMonth.indexOf("$value");
          onChanged();

          // This is called when the user selects an item.
          // setState(() {
          //   activeButtonMonth = listMonth.indexOf("$value");
          //   dropdownValue = dropdownValueMonth;

          // });
        },
        items: listMonth.map<DropdownMenuItem<String>>((String value) {
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
  );
}

//+========================================================================================

Widget widgetDropDownYear({
  required Null Function() onChanged,
  required String dropdownValue,
}) {
  return Container(
    width: 120,
    height: 40,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      //Border size & Colors

      border: Border.all(
          color: blueColor, width: 2.0, style: BorderStyle.solid), //Border.all

      //BorderRadius

      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down, size: 25, color: Colors.black),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        // underline: Container(
        //   height: 2,
        //   color: Colors.deepPurpleAccent,
        // ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          dropdownValueYear = value!;
          onChanged();
          // setState(() {
          //   dropdownValueYear = value!;
          //   print("=========================================");

          //   print(activeButtonMonth);
          // });
        },
        items: listYear.map<DropdownMenuItem<String>>((String value) {
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
  );
}
