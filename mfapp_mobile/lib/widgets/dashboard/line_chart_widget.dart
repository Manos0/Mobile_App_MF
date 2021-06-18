import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bin/colors.dart';
import '../../providers/user_stats.dart';

class LineChartWidget extends StatelessWidget {
  final List<UserFundraisers> data;

  LineChartWidget(this.data);

  final List<Color> gradientColors = [
    mfPrimaryColor,
    mfPrimaryColor,
  ];

  // printSomeData() {
  //   for (var i = 0; i < data.length; i++) {
  //     print(data[i].id);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 5,
        minY: 0,
        maxY: 6,
        titlesData: LineTitles.getTitleData(),
        borderData: FlBorderData(
          show: false,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        gridData: FlGridData(
          show: false,
          // getDrawingHorizontalLine: (value) {
          //   return FlLine(
          //     color: const Color(0xff37434d),
          //     strokeWidth: 1,
          //   );
          // },
          // drawVerticalLine: true,
          // getDrawingVerticalLine: (value) {
          //   return FlLine(
          //     color: const Color(0xff37434d),
          //     strokeWidth: 1,
          //   );
          // },
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            // dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: false,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

final List<double> yValues = [
  2.2,
  1.8,
  3,
  2.2,
  4,
  5.2,
];

month(i) {
  return DateFormat.LLL().format(DateTime.now().subtract(Duration(days: i)));
}

List<FlSpot> spots = yValues.asMap().entries.map((e) {
  return FlSpot(e.key.toDouble(), e.value);
}).toList();

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: mfLettersColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return month(150);
              case 1:
                return month(120);
              case 2:
                return month(90);
              case 3:
                return month(60);
              case 4:
                return month(30);
              case 5:
                return month(0);
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: mfLettersColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
