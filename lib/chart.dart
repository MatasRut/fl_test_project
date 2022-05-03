import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Chart extends StatefulWidget {
  Chart();

  @override
  State<Chart> createState() => _ChartState();
}

const SECONDS_IN_DAY = 86400.0;

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          border: Border.all(
            color: Colors.white12,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: 1,
              showTitles: true,
              reservedSize: 60,
            ),
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            interval: SECONDS_IN_DAY,
            getTitlesWidget: (value, meta) {
              return Text(Jiffy.unixFromSecondsSinceEpoch(value.toInt())
                  .date
                  .toString());
            },
          )),
        ),
        gridData: FlGridData(verticalInterval: SECONDS_IN_DAY),
        lineBarsData: [
          LineChartBarData(
            barWidth: 2.5,
            isCurved: false,
            dotData: FlDotData(show: false),
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff19a629).withOpacity(0.5),
                  const Color(0xff19a629).withOpacity(0.05),
                ],
              ),
            ),
            spots: [
              FlSpot(
                  Jiffy()
                      .subtract(days: 4)
                      .startOf(Units.DAY)
                      .unix()
                      .toDouble(),
                  3.14),
              FlSpot(
                  Jiffy()
                      .subtract(days: 3)
                      .startOf(Units.DAY)
                      .unix()
                      .toDouble(),
                  5.28),
              FlSpot(
                  Jiffy()
                      .startOf(Units.DAY)
                      .subtract(days: 2)
                      .unix()
                      .toDouble(),
                  9.22),
              FlSpot(
                  Jiffy()
                      .startOf(Units.DAY)
                      .subtract(days: 1)
                      .unix()
                      .toDouble(),
                  12.3),
              FlSpot(Jiffy().startOf(Units.DAY).unix().toDouble(), 3.14)
            ],
          )
        ],
      ),
    );
  }
}
