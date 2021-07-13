import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bin/colors.dart';

class LineChartWidget extends StatelessWidget {
  final List<dynamic> data;

  LineChartWidget(this.data);

  final List<Color> gradientColors = [
    mfPrimaryColor,
    mfPrimaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = data.reversed.toList().asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 5,
        minY: 0,
        // maxY: 6,
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
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            colors: gradientColors,
            barWidth: 1,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 5,
                  color: gradientColors[0],
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
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

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: mfLettersColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          getTitles: (value) {
            var dateNow = DateTime.now();
            switch (value.toInt()) {
              case 0:
                return DateFormat.LLL()
                    .format(DateTime(dateNow.year, dateNow.month - 5, 15));
              case 1:
                return DateFormat.LLL()
                    .format(DateTime(dateNow.year, dateNow.month - 4, 15));
              case 2:
                return DateFormat.LLL()
                    .format(DateTime(dateNow.year, dateNow.month - 3, 15));
              case 3:
                return DateFormat.LLL()
                    .format(DateTime(dateNow.year, dateNow.month - 2, 15));
              case 4:
                return DateFormat.LLL()
                    .format(DateTime(dateNow.year, dateNow.month - 1, 15));
              case 5:
                return DateFormat.LLL().format(dateNow);
            }
            return '';
          },
          margin: 15,
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
