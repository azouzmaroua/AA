import 'package:flutter/material.dart';
import 'package:my_parfum/test/widgetChart.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//++++++++++++++++++++++++++++++++++++++++++
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

//late List<ChartSampleData>? _chartData;

class ChartSampleData {
  ChartSampleData(this.x, this.revenue, this.profit);
  final DateTime x;
  final double revenue;
  final double profit;
}

List<ChartSampleData> getChartData() {
  return <ChartSampleData>[
    ChartSampleData(DateTime(2022, 1, 1), 3, 9),
    ChartSampleData(DateTime(2022, 2, 1), 5, 11),
    ChartSampleData(DateTime(2022, 3, 1), 8, 13),
    ChartSampleData(DateTime(2022, 4, 1), 7, 17),
    ChartSampleData(DateTime(2022, 5, 1), 8, 9),
    ChartSampleData(DateTime(2022, 6, 1), 5, 11),
    ChartSampleData(DateTime(2022, 7, 1), 5, 11),
    ChartSampleData(DateTime(2022, 8, 1), 5, 11),
    ChartSampleData(DateTime(2022, 9, 1), 5, 11),
    ChartSampleData(DateTime(2022, 10, 1), 5, 11),
    ChartSampleData(DateTime(2022, 11, 1), 5, 11),
    ChartSampleData(DateTime(2022, 12, 1), 5, 11),
  ];
}

Widget WidgetChartx({
  // required ChartSampleData ChartSampleData,
  required String titel,
  required List<ChartSampleData> chartData,
}) {
  return SfCartesianChart(
    legend: Legend(isVisible: true),
    tooltipBehavior: TooltipBehavior(enable: true),
    title: ChartTitle(text: 'Statistiques'),
    series: <ChartSeries<ChartSampleData, DateTime>>[
      ColumnSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        name: 'Profits',
        color: Color(0xff5cf17c),
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.revenue,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        borderRadius: BorderRadius.all(Radius.circular(9)),
        spacing: 2,
      ),
      ColumnSeries<ChartSampleData, DateTime>(
          spacing: 2,
          dataSource: chartData,
          name: 'Revenue',
          color: Color(0xff87b8f3),
          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.profit,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          borderRadius: BorderRadius.all(Radius.circular(9))),
    ],
    primaryXAxis: DateTimeAxis(
        //zoomFactor: 0.5,
        //zoomFactor: 0.1,
        // maximum: DateTime(12),
        // minimum: 0,
        labelPosition: ChartDataLabelPosition.outside,
        // maximumLabels: 24,
        //
        interval: 1,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.MMM(),
        intervalType: DateTimeIntervalType.months,
        majorGridLines: MajorGridLines(width: 0)),
    // primaryXAxis: DateTimeAxis(
    //     //zoomFactor: 0.5,
    //     //zoomFactor: 0.1,
    //     // maximum: DateTime(12),
    //     // minimum: 0,
    //     interval: 1,
    //     edgeLabelPlacement: EdgeLabelPlacement.shift,
    //     dateFormat: DateFormat.MMM(),
    //     intervalType: DateTimeIntervalType.months,
    //     majorGridLines: MajorGridLines(width: 0)),

    primaryYAxis: NumericAxis(labelFormat: '{value} DA'),
  );
}



//
