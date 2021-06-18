import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mfapp_mobile/bin/colors.dart';

import '../../providers/bar_data.dart';
import '../../providers/data.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 8;
  final data;

  BarChartWidget(this.data);
  // printSomeData() {
  //   for (var i = 0; i < data.length; i++) {
  //     print(data[i].id);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border(
            bottom: BorderSide(
              color: mfLettersColor,
              width: 1,
            ),
          ),
        ),
        alignment: BarChartAlignment.center,
        maxY: 20,
        minY: 0,
        groupsSpace: 40,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: BarTitles.getTopBottomTitles(),
          leftTitles: BarTitles.getSideTitles(),
        ),
        gridData: FlGridData(
          checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
          getDrawingHorizontalLine: (value) {
            if (value == 0) {
              return FlLine(
                color: mfLettersColor,
                strokeWidth: 0.5,
              );
            } else {
              return FlLine(
                color: mfLettersColor,
                strokeWidth: 0.5,
              );
            }
          },
        ),
        barGroups: BarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.id,
                barRods: [
                  BarChartRodData(
                    y: data.y,
                    width: barWidth,
                    colors: [data.color],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        margin: 5,
        // rotateAngle: 45,
        getTitles: (double id) => BarData.barData
            .firstWhere((element) => element.id == id.toInt())
            .name,
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: false,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        rotateAngle: 90,
        interval: BarData.interval.toDouble(),
        margin: 10,
        reservedSize: 10,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
      );
}
