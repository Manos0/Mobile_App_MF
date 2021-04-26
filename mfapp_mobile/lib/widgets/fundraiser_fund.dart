import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:percent_indicator/percent_indicator.dart';

import '../providers/auth.dart';
import '../screens/fundraiser_detail_screen.dart';
import '../providers/fundraiser.dart';
<<<<<<< HEAD
import '../screens/fundraisers_screen.dart';
=======
import '../bin/api_addresses.dart';
>>>>>>> development
import '../providers/fundraisers.dart';
import '../widgets/fundraisers_grid.dart';

class FundraiserFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);
<<<<<<< HEAD
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              FundraisersScreen.routeName,
              arguments: fundraiser.id,
            );
          },
          child: Image.network(
            'https://mfdev.t-worxsites.com' + fundraiser.clientAvatarMD,
            fit: BoxFit.cover,
          ),
        ),
        footer: Text(
          (fundraiser.firstName.isNotEmpty ? fundraiser.firstName : '') +
              (fundraiser.nickName != null && fundraiser.nickName.length > 0
                  ? ' "' + fundraiser.nickName + '"'
                  : '') +
              (fundraiser.middleName != null && fundraiser.middleName.length > 0
                  ? ' ' + fundraiser.middleName
                  : '') +
              (fundraiser.lastName != null && fundraiser.lastName.length > 0
                  ? ' ' + fundraiser.lastName
                  : ''),
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
=======
    // double fundPercentage =
    //     ((fundraiser.fundRaised * 100) / fundraiser.goalAmount) / 100;
    // fundPercentage = num.parse(fundPercentage.toStringAsFixed(4));
    double fundPercentage() {
      double percentage = 0;
      if (fundraiser.fundRaised > 0 && fundraiser.goalAmount > 0) {
        if (fundraiser.fundRaised <= fundraiser.goalAmount) {
          percentage =
              ((fundraiser.fundRaised * 100) / fundraiser.goalAmount) / 100;
        } else {
          percentage = 1;
        }
      } else {
        percentage = 0;
      }
      return percentage = num.parse(percentage.toStringAsFixed(4));
    }

    image(image) {
      if (fundraiser.clientAvatarMD != null &&
          fundraiser.clientAvatarMD.length > 0) {
        return NetworkImage(baseUrl + fundraiser.clientAvatarMD);
      } else {
        return AssetImage('assets/images/helperImage.png');
      }
    }

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
                        // image: (fundraiser.clientAvatarMD != null &&
                        //         fundraiser.clientAvatarMD.length > 0
                        //     ? NetworkImage(
                        //         baseUrl + fundraiser.clientAvatarMD,
                        //       )
                        //     : AssetImage('assets/images/helperImage.png')),
                        image: image(fundraiser.clientAvatarMD),
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
            Container(
              margin: EdgeInsets.only(bottom: 6),
              // color: Color.fromRGBO(128, 128, 128, 0.5),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                // color: Theme.of(context).primaryColor,
                height: 5,
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? ((MediaQuery.of(context).size.width - 75) / 2) *
                            fundPercentage()
                        : ((MediaQuery.of(context).size.width - 146) / 4) *
                            fundPercentage()),
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
                    '${(fundPercentage() * 100).toStringAsFixed(2)}%',
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
>>>>>>> development
        ),
      ),
    );
  }
}
