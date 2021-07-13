import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mfapp_mobile/bin/colors.dart';

import '../../providers/bar_data.dart';
import '../../providers/data.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 8;
  final List<dynamic> data;

  BarChartWidget(this.data);

  @override
  Widget build(BuildContext context) {
    int interval = 5;
    dayOfWeek(i) {
      return Data(
        name: DateFormat.E().format(DateTime.now().subtract(Duration(days: i))),
        id: i,
        y: data[i].toDouble(),
        color: mfPrimaryColor,
      );
    }

    List<Data> barData = [
      dayOfWeek(6),
      dayOfWeek(5),
      dayOfWeek(4),
      dayOfWeek(3),
      dayOfWeek(2),
      dayOfWeek(1),
      dayOfWeek(0),
    ];
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border(
            bottom: BorderSide(
              color: mfLightlightBlueColor,
              width: 1,
            ),
          ),
        ),
        alignment: BarChartAlignment.center,
        // maxY: 20,
        //an to bgaleis apo comment kanei overflow sto height
        minY: 0,
        groupsSpace: 40,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            margin: 8,
            // rotateAngle: 45,
            getTitles: (double id) =>
                barData.firstWhere((element) => element.id == id.toInt()).name,
          ),
          leftTitles: SideTitles(
            showTitles: false,
            getTextStyles: (value) => const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            rotateAngle: 90,
            interval: interval.toDouble(),
            margin: 10,
            reservedSize: 10,
            getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
          ),
        ),
        gridData: FlGridData(
          checkToShowHorizontalLine: (value) => value % interval == 0,
          getDrawingHorizontalLine: (value) {
            if (value == 5) {
              return FlLine(
                color: mfLightlightBlueColor,
                strokeWidth: 1,
              );
            } else {
              return FlLine(
                color: mfLightlightBlueColor,
                strokeWidth: 1,
              );
            }
          },
        ),
        barGroups: barData
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

// dayOfWeek(i) {
//   return Data(
//     name: DateFormat.E().format(DateTime.now().subtract(Duration(days: i))),
//     id: i,
//     color: mfPrimaryColor,
//   );
// }

// class BarData {
//   static int interval = 5;
//   static List<Data> bardata = [
//     dayOfWeek(6),
//     dayOfWeek(5),
//     dayOfWeek(4),
//     dayOfWeek(3),
//     dayOfWeek(2),
//     dayOfWeek(1),
//     dayOfWeek(0),
//   ];
// }

// List<double> dailyDonations = [10, 15, 5, 4, 1, 6, 40];

// class BarTitles {
//   static SideTitles getTopBottomTitles() => SideTitles(
//         showTitles: true,
//         getTextStyles: (value) => const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         margin: 5,
//         // rotateAngle: 45,
//         getTitles: (double id) => BarData.bardata
//             .firstWhere((element) => element.id == id.toInt())
//             .name,
//       );

  // static SideTitles getSideTitles() => SideTitles(
  //       showTitles: false,
  //       getTextStyles: (value) => const TextStyle(
  //         color: Colors.black,
  //         fontSize: 10,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       rotateAngle: 90,
  //       interval: BarData.interval.toDouble(),
  //       margin: 10,
  //       reservedSize: 10,
  //       getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
  //     );
// }
