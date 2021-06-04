import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../bin/colors.dart';
import '../../bin/functions.dart';

class FundsTotalAndRaised extends StatelessWidget {
  final data;

  FundsTotalAndRaised(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
          bottomLeft: Radius.circular(13),
          bottomRight: Radius.circular(13),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(37, 20, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Daily Goal',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Total',
                    style: TextStyle(
                      color: mfSecondaryLetterColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: (MediaQuery.of(context).size.width < 412
                      ? MediaQuery.of(context).size.width / 3
                      : MediaQuery.of(context).size.width / 2),
                  child: Text(
                    'This will be a some point a long text?This will be a some point a long text?This will be a some point a long text?This will be a some point a long text?',
                    style: TextStyle(
                      color: mfSecondaryLetterColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 27, 25),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 125,
                  lineWidth: 10,
                  percent:
                      fundPercentage(data.totalGoalAmount, data.totalDonations),
                  backgroundColor: Color.fromRGBO(0, 219, 176, 0.1),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Theme.of(context).primaryColor,
                  center: Text(
                    '${fundPercentage(data.totalGoalAmount, data.totalDonations).toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 10,
                  percent:
                      fundPercentage(data.totalDonations, data.totalGoalAmount),
                  backgroundColor: Color.fromRGBO(58, 204, 225, 0.1),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromRGBO(58, 204, 225, 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
