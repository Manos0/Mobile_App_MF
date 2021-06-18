import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../screens/fundraiser_detail_screen.dart';
import '../../providers/fundraiser.dart';
import '../../bin/functions.dart';
import '../../bin/colors.dart';

class FundraiserFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);

    return Material(
      elevation: 3,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.375),
      borderRadius: BorderRadius.circular(11),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        FundraiserDetailScreen.routeName,
                        arguments: fundraiser.id);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.width < 768
                        ? MediaQuery.of(context).size.height / 6
                        : MediaQuery.of(context).size.height / 3),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: fundImage(fundraiser.clientAvatarMD),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                (fundraiser.firstName.isNotEmpty ? fundraiser.firstName : '') +
                    (fundraiser.nickName != null &&
                            fundraiser.nickName.length > 0
                        ? ' "' + fundraiser.nickName + '"'
                        : '') +
                    (fundraiser.middleName != null &&
                            fundraiser.middleName.length > 0
                        ? ' ' + fundraiser.middleName
                        : '') +
                    (fundraiser.lastName != null &&
                            fundraiser.lastName.length > 0
                        ? ' ' + fundraiser.lastName
                        : ''),
                style: TextStyle(
                  color: mfLettersColor,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 7),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '\$${fundraiser.fundRaised.toStringAsFixed(0)}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: LinearPercentIndicator(
                lineHeight: 4,
                percent: fundPercentage(
                    fundraiser.fundRaised, fundraiser.goalAmount),
                backgroundColor: Colors.grey[300],
                progressColor: Theme.of(context).primaryColor,
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
        ),
      ),
    );
  }
}
