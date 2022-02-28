import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../bin/colors.dart';
import '../../bin/functions.dart';
import '../../screens/fundraiser_detail_screen.dart';

class MyFundraisers extends StatelessWidget {
  final data;

  MyFundraisers(this.data);

  @override
  Widget build(BuildContext context) {
    double fundPercentage() {
      double percentage = 0;
      if (data.fundRaised > 0 && data.goalAmount > 0) {
        if (data.fundRaised <= data.goalAmount) {
          percentage = ((data.fundRaised * 100) / data.goalAmount) / 100;
        } else {
          percentage = 1;
        }
      } else {
        percentage = 0;
      }
      return percentage = num.parse(percentage.toStringAsFixed(4));
    }

    DateTime dateCreated = new DateFormat('yyyy-MM-dd').parse(data.dateCreated);
    var creationDate = DateFormat.yMd().format(dateCreated);

    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (data.firstName.isNotEmpty ? data.firstName : '') +
                              (data.nickName != null && data.nickName.length > 0
                                  ? ' "' + data.nickName + '"'
                                  : '') +
                              (data.middleName != null &&
                                      data.middleName.length > 0
                                  ? ' ' + data.middleName
                                  : '') +
                              (data.lastName != null && data.lastName.length > 0
                                  ? ' ' + data.lastName
                                  : ''),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Published: ' + creationDate,
                          style: TextStyle(
                            color: mfLightlightGrey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/helperImage.png'),
                      image: myFundImage(data.clientAvatarMD),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        FundraiserDetailScreen.routeName,
                        arguments: data.id);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                ' \$${data.fundRaised.toStringAsFixed(0)} ',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'of \$${data.goalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  color: mfLightlightGrey,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: LinearPercentIndicator(
              padding: EdgeInsets.all(5),
              lineHeight: 4,
              percent: fundPercentage(),
              animation: true,
              animationDuration: 600,
              backgroundColor: Colors.white12,
              progressColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
