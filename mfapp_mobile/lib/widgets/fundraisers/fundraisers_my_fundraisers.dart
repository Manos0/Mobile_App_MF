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
      if (data.userFundraisers[0].fundRaised > 0 &&
          data.userFundraisers[0].goalAmount > 0) {
        if (data.userFundraisers[0].fundRaised <=
            data.userFundraisers[0].goalAmount) {
          percentage = ((data.userFundraisers[0].fundRaised * 100) /
                  data.userFundraisers[0].goalAmount) /
              100;
        } else {
          percentage = 1;
        }
      } else {
        percentage = 0;
      }
      return percentage = num.parse(percentage.toStringAsFixed(4));
    }

    DateTime dateCreated =
        new DateFormat('yyyy-MM-dd').parse(data.userFundraisers[0].dateCreated);
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
                          (data.userFundraisers[0].firstName.isNotEmpty
                                  ? data.userFundraisers[0].firstName
                                  : '') +
                              (data.userFundraisers[0].nickName != null &&
                                      data.userFundraisers[0].nickName.length >
                                          0
                                  ? ' "' +
                                      data.userFundraisers[0].nickName +
                                      '"'
                                  : '') +
                              (data.userFundraisers[0].middleName != null &&
                                      data.userFundraisers[0].middleName
                                              .length >
                                          0
                                  ? ' ' + data.userFundraisers[0].middleName
                                  : '') +
                              (data.userFundraisers[0].lastName != null &&
                                      data.userFundraisers[0].lastName.length >
                                          0
                                  ? ' ' + data.userFundraisers[0].lastName
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
                      image:
                          myFundImage(data.userFundraisers[0].clientAvatarMD),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        FundraiserDetailScreen.routeName,
                        arguments: data.userFundraisers[0].id);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                ' \$${data.userFundraisers[0].fundRaised.toStringAsFixed(0)} ',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'of \$${data.userFundraisers[0].goalAmount.toStringAsFixed(0)}',
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
              backgroundColor: Colors.grey[300],
              progressColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
