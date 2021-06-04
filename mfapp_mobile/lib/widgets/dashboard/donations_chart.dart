import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationsChart extends StatelessWidget {
  final fundraiser;

  DonationsChart(this.fundraiser);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalDonations = 0;

      for (var i = 0; i < fundraiser.payment.length; i++) {
        if (fundraiser.payment[i].paymentPaymentDate.day == weekDay.day &&
            fundraiser.payment[i].paymentPaymentDate.month == weekDay.month &&
            fundraiser.payment[i].paymentPaymentDate.year == weekDay.year) {
          totalDonations += fundraiser.payment.length;
        }
      }
      print(DateFormat.E(weekDay));
      print(totalDonations);

      return {
        'day': DateFormat.E(weekDay),
        'donations': totalDonations,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
