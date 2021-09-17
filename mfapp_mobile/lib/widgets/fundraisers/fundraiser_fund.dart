import 'package:flutter/material.dart';
import 'package:mfapp_mobile/providers/user_stats.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../screens/fundraiser_detail_screen.dart';
import '../../bin/functions.dart';
import '../../bin/colors.dart';

class FundraiserFund extends StatelessWidget {
  List<UserFundraisers> widgetData;
  int i;
  FundraiserFund({this.widgetData, this.i});

  @override
  Widget build(BuildContext context) {
    // final fundraiser = Provider.of<Fundraiser>(context, listen: false);

    return Material(
      elevation: 1,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.375),
      borderRadius: BorderRadius.circular(11),
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            FundraiserDetailScreen.routeName,
                            arguments: widgetData[i].id);
                      },
                      child: FadeInImage(
                        placeholder:
                            AssetImage('assets/images/helperImage.png'),
                        image: fundImage(widgetData[i].clientAvatarMD),
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.width < 768
                            ? MediaQuery.of(context).size.height / 6
                            : MediaQuery.of(context).size.height / 3),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      if (widgetData[i].firstName != null &&
                          widgetData[i].firstName.length > 0)
                        Text(
                          widgetData[i].firstName + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (widgetData[i].nickName != null &&
                          widgetData[i].nickName.length > 0)
                        Text(
                          '"' + widgetData[i].nickName + '"' + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (widgetData[i].middleName != null &&
                          widgetData[i].middleName.length > 0)
                        Text(
                          widgetData[i].middleName + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (widgetData[i].lastName != null &&
                          widgetData[i].lastName.length > 0)
                        Text(
                          widgetData[i].lastName,
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            //   child: Text(
            //     (widgetData.userFundraisers[i].firstName.isNotEmpty
            //             ? widgetData.userFundraisers[i].firstName
            //             : '') +
            //         (widgetData.userFundraisers[i].nickName != null &&
            //                 widgetData.userFundraisers[i].nickName.length > 0
            //             ? ' "' + widgetData.userFundraisers[i].nickName + '"'
            //             : '') +
            //         (widgetData.userFundraisers[i].middleName != null &&
            //                 widgetData.userFundraisers[i].middleName.length > 0
            //             ? ' ' + widgetData.userFundraisers[i].middleName
            //             : '') +
            //         (widgetData.userFundraisers[i].lastName != null &&
            //                 widgetData.userFundraisers[i].lastName.length > 0
            //             ? ' ' + widgetData.userFundraisers[i].lastName
            //             : ''),
            //     style: TextStyle(
            //       color: mfLettersColor,
            //       fontFamily: 'Poppins',
            //       fontSize: 14,
            //       fontWeight: FontWeight.w600,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 7),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    '\$${widgetData[i].fundRaised.toStringAsFixed(0)}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: mfLightBlueColor,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.all(0),
                    lineHeight: 4,
                    percent: fundPercentage(
                        widgetData[i].fundRaised, widgetData[i].goalAmount),
                    backgroundColor: Colors.grey[300],
                    progressColor: mfLightBlueColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal: \$${widgetData[i].goalAmount.toStringAsFixed(0)}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${(fundPercentage(widgetData[i].fundRaised, widgetData[i].goalAmount) * 100).toStringAsFixed(2)}%',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
