import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class stret_static extends StatefulWidget {
  final List? list;
  const stret_static({Key? key, this.list}) : super(key: key);
  _stret_staticState createState() => _stret_staticState();
}

class _stret_staticState extends State<stret_static> {
  late List<ChartSampleData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        title: ChartTitle(text: 'Statistiques'),
        series: <ChartSeries<ChartSampleData, DateTime>>[
          ColumnSeries<ChartSampleData, DateTime>(
            dataSource: _chartData,
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
              dataSource: _chartData,
              name: 'Revenue',
              color: Color(0xff87b8f3),
              xValueMapper: (ChartSampleData data, _) => data.x,
              yValueMapper: (ChartSampleData data, _) => data.profit,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ],
        primaryXAxis: DateTimeAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            dateFormat: DateFormat.MMM(),
            intervalType: DateTimeIntervalType.months,
            majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(labelFormat: '{value} DA'),
      ),
    ));
  }

  List<ChartSampleData> getChartData() {
    return <ChartSampleData>[
      ChartSampleData(DateTime(2022, 1, 1), 3, 9),
      ChartSampleData(DateTime(2022, 2, 1), 5, 11),
      ChartSampleData(DateTime(2022, 3, 1), 8, 13),
      ChartSampleData(DateTime(2022, 4, 1), 7, 17),
      ChartSampleData(DateTime(2022, 5, 1), 8, 9),
      ChartSampleData(DateTime(2022, 6, 1), 5, 11),
    ];
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.revenue, this.profit);
  final DateTime x;
  final double revenue;
  final double profit;
}
