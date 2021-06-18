import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../providers/data.dart';
import '../bin/colors.dart';

List<double> dailyDonations = [10, 15, 5, 4, 1, 6, 19];

// dayOfWeek() {
//   for (var i = 0; i < 7; i++) {
//     return Data(
//       name: DateFormat.E().format(DateTime.now().subtract(Duration(days: i))),
//       id: i,
//       y: dailyDonations[i],
//       color: mfPrimaryColor,
//     );
//   }
// }
dayOfWeek(i) {
  return Data(
    name: DateFormat.E().format(DateTime.now().subtract(Duration(days: i))),
    id: i,
    y: dailyDonations[i],
    color: mfPrimaryColor,
  );
}

// var date = DateFormat.EEEE().format(DateTime.now().subtract(Duration(days: 1)));
// List<Map<String, dynamic>> chartDays = [];

//   for (var i=0; i<7; i++) {
//     chartDays.push({
//       id: i,
//       name: DateFormat.EEEE().format(DateTime.now().subtract(Duration(days: 1)),
//       y: intFromSakis,
//       color: mfPrimaryColor,
//   })
//   var barData = new List.from(chartDays.reversed);

// var dailyDonations = [1000,2000,1200,1300....];

class BarData {
  static int interval = 5;
  static List<Data> barData = [
    dayOfWeek(6),
    dayOfWeek(5),
    dayOfWeek(4),
    dayOfWeek(3),
    dayOfWeek(2),
    dayOfWeek(1),
    dayOfWeek(0),
    // Data(
    //   id: 0,
    //   name: dayOfWeek(6),
    //   y: 15,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(5),
    //   id: 1,
    //   y: 12,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(4),
    //   id: 2,
    //   y: 11,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(3),
    //   id: 3,
    //   y: 10,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(2),
    //   id: 4,
    //   y: 5,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(1),
    //   id: 5,
    //   y: 17,
    //   color: mfPrimaryColor,
    // ),
    // Data(
    //   name: dayOfWeek(0),
    //   id: 6,
    //   y: 5,
    //   color: mfPrimaryColor,
    // ),
  ];
}
