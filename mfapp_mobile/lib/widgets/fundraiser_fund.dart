import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(12),
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
              padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
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
          ],
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: GridTile(
    //     child: GestureDetector(
    //       onTap: () {
    //         Navigator.of(context).pushNamed(FundraiserDetailScreen.routeName,
    //             arguments: fundraiser.id);
    //       },
    //       child: Image.network(
    //         'https://mfdev.t-worxsites.com' + fundraiser.clientAvatarSM,
    //         fit: BoxFit.cover,
    //       ),
    //       // child: Image.network(
    //       //   'https://mfdev.t-worxsites.com/Portals/0/Users/003/03/3/-1/Small/Test_TimeZone_73a6ef47-a296-4df8-9c12-4a7a34653b27.jpg',
    //       //   fit: BoxFit.cover,
    //       // ),
    //     ),
    //     footer: Text(
    //       (fundraiser.firstName.isNotEmpty ? fundraiser.firstName : '') +
    //           (fundraiser.nickName != null && fundraiser.nickName.length > 0
    //               ? ' "' + fundraiser.nickName + '"'
    //               : '') +
    //           (fundraiser.middleName != null && fundraiser.middleName.length > 0
    //               ? ' ' + fundraiser.middleName
    //               : '') +
    //           (fundraiser.lastName != null && fundraiser.lastName.length > 0
    //               ? ' ' + fundraiser.lastName
    //               : ''),
    //       style: TextStyle(color: Colors.black),
    //       textAlign: TextAlign.left,
    //     ),
    //   ),
    // );
  }
}
