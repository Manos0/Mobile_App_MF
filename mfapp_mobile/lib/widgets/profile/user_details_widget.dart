import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';

import '../../bin/api_addresses.dart';
import '../../widgets/profile/profile_yourfundraisers.dart';
import '../../widgets/profile/funds_total_and_raised.dart';
import '../../widgets/profile/cubes_bottom.dart';
import '../../widgets/profile/add_fundraiser_button.dart';

class UserDetailsWidget extends StatelessWidget {
  final userData;

  UserDetailsWidget(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10, bottom: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        radius: 35.5,
                        backgroundImage: NetworkImage(
                            baseUrl + userData.userDetails.photoUrl),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Hello,' + ' ' + '${userData.userDetails.displayName}',
                        style: TextStyle(
                            color: Color.fromRGBO(26, 26, 38, 1),
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                        softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 181,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 250, 248, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13)),
                ),
                child: ProfileYourFundraisers(userData),
              ),
              // AddFundraiserButton(),
              FundsTotalAndRaised(userData),
              Container(
                // height: MediaQuery.of(context).size.height / 1.6,
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: BottomCubes(userData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
