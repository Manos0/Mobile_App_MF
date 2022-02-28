import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../screens/fundraiser_detail_screen.dart';
import '../../providers/fundraiser.dart';
import '../../bin/functions.dart';
import '../../bin/colors.dart';

class FundraisersSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);
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
                            arguments: fundraiser.id);
                      },
                      child: FadeInImage(
                        placeholder:
                            AssetImage('assets/images/helperImage.png'),
                        image: fundImage(fundraiser.clientAvatarMD),
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
                      if (fundraiser.firstName != null &&
                          fundraiser.firstName.length > 0)
                        Text(
                          fundraiser.firstName + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (fundraiser.nickName != null &&
                          fundraiser.nickName.length > 0)
                        Text(
                          '"' + fundraiser.nickName + '"' + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (fundraiser.middleName != null &&
                          fundraiser.middleName.length > 0)
                        Text(
                          fundraiser.middleName + ' ',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (fundraiser.lastName != null &&
                          fundraiser.lastName.length > 0)
                        Text(
                          fundraiser.lastName,
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
                    '\$${fundraiser.fundRaised.toStringAsFixed(0)}',
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
                        fundraiser.fundRaised, fundraiser.goalAmount),
                    backgroundColor: Colors.grey[300],
                    progressColor: mfLightBlueColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal: \$${fundraiser.goalAmount.toStringAsFixed(0)}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${(fundPercentage(fundraiser.fundRaised, fundraiser.goalAmount) * 100).toStringAsFixed(2)}%',
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
