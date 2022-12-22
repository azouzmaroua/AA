import 'package:flutter/material.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_dropDown_time.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_scrol_monthes_button.dart';

class Chart_view extends StatefulWidget {
  const Chart_view({super.key});

  @override
  State<Chart_view> createState() => _Chart_viewState();
}

class _Chart_viewState extends State<Chart_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: Column(
        children: [
          Row(
            children: [
              widgetDropDownMonth(
                  dropdownValue: dropdownValueMonth,
                  onChanged: () {
                    setState(() {
                      activeButtonMonth = listMonth.indexOf("today");
                      dropdownValueMonth = dropdownValueMonth;
                    });
                  }),
              widgetDropDownYear(
                  dropdownValue: dropdownValueYear,
                  onChanged: () {
                    setState(() {
                      dropdownValueYear = dropdownValueYear;
                    });
                  }),
            ],
          ),
          widgetSscrolMonthesButton(onTap: () {
            setState(() {
              activeButtonMonth = activeButtonMonth;

              dropdownValueMonth = listMonth[activeButtonMonth];
            });
          }),
        ],
      ),
    );
    ;
  }
}
