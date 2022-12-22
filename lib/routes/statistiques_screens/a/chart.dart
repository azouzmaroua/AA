import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/data/getOrders.dart';
import 'package:my_parfum/functions/getTime.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_dropDown_time.dart';
import 'package:my_parfum/routes/statistiques_screens/widget_scrol_monthes_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class chart extends StatefulWidget {
  const chart({Key? key}) : super(key: key);
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  List<ChartSampleData> chartData = [];
  late TooltipBehavior _tooltipBehavior;
  List listVentes = [];
  @override
  void initState() {
    getData();

    print("3**************1112*******************");
    print("3**************1112*******************");
    print("3**************1112*******************");

    print("3**************1112*******************");
    print("$listVentes");
    print("3**************1112*******************");
    print("$chartData");
    print("3**************1112*******************");
    print("3**************1112*******************");
    print("3**************1112*******************");

    //hna l problem klifach njib liste
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  //2 second get

  getData() async {
    //قلب ليست
    print("11111111111111111111111");
    listVentes = await getOrders();
    print("11111111111111111111111");

    listVentes.forEach((element) {
      ChartSampleData a = ChartSampleData(
          element[" IdTimeEnter"].toString(),
          element["total-reveresnse-ordres-payes"].toDouble(),
          element["total-profti-ordres-payes"].toDouble());

      setState(() {
        chartData.add(a);
      });
    });
    print("11111111111111111111111");

    print(chartData);
    print("11111111111111111111111");
    print("3*********************************");
    print("$listVentes"); //hadhi taffichili shih
    setState(() {
      chartData = getChartData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        title: ChartTitle(text: 'Statistiques'),
        primaryXAxis: CategoryAxis(
            arrangeByIndex: true, labelPlacement: LabelPlacement.onTicks),

        series: <ChartSeries<ChartSampleData, String>>[
          ColumnSeries<ChartSampleData, String>(
            dataSource: chartData,
            name: 'Profits',
            color: Color(0xff5cf17c),
            xValueMapper: (ChartSampleData data, _) => data.x.substring(5, 10),
            yValueMapper: (ChartSampleData data, _) => data.revenue,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            borderRadius: BorderRadius.all(Radius.circular(9)),
            spacing: 2,
          ),
          ColumnSeries<ChartSampleData, String>(
              spacing: 2,
              dataSource: chartData,
              name: 'Revenue',
              color: Color(0xff87b8f3),
              xValueMapper: (ChartSampleData data, _) => data.x,
              yValueMapper: (ChartSampleData data, _) => data.profit,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ],
        // primaryXAxis: DateTimeAxis(
        //   edgeLabelPlacement: EdgeLabelPlacement.shift,
        //  dateFormat: DateFormat.d(),
        //  intervalType: DateTimeIntervalType.days,
        // majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(labelFormat: '{value} DA'),
      ),
    ));
  }

  List<ChartSampleData> getChartData() {
    List<ChartSampleData> l = [];
    int i = 0;
    print("list ll: $l");
    print("+++++++++++++++++++++++++$chartData"); //hadhi ghalta

    if (chartData.length > 10) {
      while (i < 10) {
        ChartSampleData a = ChartSampleData(chartData[i].x.toString(),
            chartData[i].revenue, chartData[i].profit);
        l.add(a);
        i++;
      }
    } else {
      l = chartData;
      print('llllllllllllllllllllllllllllllllllllllllllllllll');
      print(l);
    }

    print(l);

    return l;
    // list hadi farga ?????
    // hna kon nhot l code ta3 for each mana9derch n3gb lie st
    //
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<ChartSampleData>('chartData', chartData));
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.revenue, this.profit);
  String x;
  double revenue;
  double profit;
}
