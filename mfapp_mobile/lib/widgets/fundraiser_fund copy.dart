import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:percent_indicator/percent_indicator.dart';

import '../providers/auth.dart';
import '../screens/fundraiser_detail_screen.dart';
import '../providers/fundraiser.dart';
import '../bin/api_addresses.dart';
import '../providers/fundraisers.dart';
import '../widgets/fundraisers_grid.dart';

class FundraiserFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);
    double fundPercentage =
        ((fundraiser.fundRaised * 100) / fundraiser.goalAmount) / 100;
    fundPercentage = num.parse(fundPercentage.toStringAsFixed(4));
    // double fundPercentage() {
    //   double percentage = 0;
    //   if (fundraiser.fundRaised > 0 && fundraiser.goalAmount > 0) {
    //     if (fundraiser.fundRaised <= fundraiser.goalAmount) {
    //       return percentage = ((fundraiser.fundRaised * 100) / fundraiser.goalAmount);
    //     } else {
    //       return percentage = 100;
    //     }
    //   } else {
    //     return percentage = 0;
    //   }
    // }

    print(fundPercentage);
    return Material(
      elevation: 3,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.375),
      borderRadius: BorderRadius.circular(9),
      child: Container(
        margin: EdgeInsets.all(12),
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
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          baseUrl + fundraiser.clientAvatarMD,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
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
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
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
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            //   child: LinearPercentIndicator(
            //     width: 100,
            //     lineHeight: 20.0,
            //     percent: fundPercentage,
            //     backgroundColor: Color.fromRGBO(128, 128, 128, 0.5),
            //     progressColor: Theme.of(context).primaryColor,
            //     center: Text('${(fundPercentage * 100).toStringAsFixed(2)}%'),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(bottom: 6),
              // color: Color.fromRGBO(128, 128, 128, 0.5),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 5,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? ((MediaQuery.of(context).size.width - 78) / 2) *
                            fundPercentage
                        : ((MediaQuery.of(context).size.width - 146) / 4) *
                            fundPercentage),
              ),
            ),
            Container(
              child: Row(
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
                    '${(fundPercentage * 100).toStringAsFixed(2)}%',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontFamily: 'Poppins',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// container
// width: full width,
// background-color: rgba(0,0,0,0.5)
// > container:
//     background-color: green,
//     height: 5px
//     width: ( MediaQuery.of(context).size.width / 100 ) * fundraiser.GoalPercentage
