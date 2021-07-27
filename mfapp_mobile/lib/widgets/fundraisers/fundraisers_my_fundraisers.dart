import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../bin/colors.dart';
import '../../bin/functions.dart';

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
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(5),
                      //   child: Text(
                      //     'Date Publiced: ' + creationDate,
                      //     style: TextStyle(
                      //       color: mfLightGrey,
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (data.userFundraisers[0].firstName.isNotEmpty
                                    ? data.userFundraisers[0].firstName
                                    : '') +
                                (data.userFundraisers[0].nickName != null &&
                                        data.userFundraisers[0].nickName
                                                .length >
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
                                        data.userFundraisers[0].lastName
                                                .length >
                                            0
                                    ? ' ' + data.userFundraisers[0].lastName
                                    : ''),
                            style: TextStyle(
                                color: mfLettersColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          // padding: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Published: ' + creationDate,
                            style: TextStyle(
                              color: mfLightGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Raised',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
                Text(
                  ' \$${data.userFundraisers[0].fundRaised.toStringAsFixed(0)} ',
                  style: TextStyle(
                    color: mfLightBlueColor,
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
                Text(
                  'of \$${data.userFundraisers[0].goalAmount.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: LinearPercentIndicator(
              lineHeight: 4,
              percent: fundPercentage(),
              animation: true,
              animationDuration: 600,
              backgroundColor: Colors.grey[300],
              progressColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
