import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../bin/api_addresses.dart';
import '../../widgets/profile/profile_yourfundraisers.dart';
import '../../providers/provider.dart';
import '../../providers/user_stats.dart';
import './bars_widget.dart';
import './profile_locations_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  UserStats userData;
  // Future<List<Locations>> locations;

  UserDetailsWidget(this.userData);
  //  UserDetailsWidget(this.userData, this.locations);

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<Fundraisers>(context);
    final locations = locationData.locationList;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color2],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 25),
                padding: const EdgeInsets.only(right: 16, top: 15, left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: FadeInImage(
                        placeholder:
                            AssetImage('assets/images/helperImage.png'),
                        image: NetworkImage(
                            baseUrl + userData.userDetails.photoUrl),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          '${userData.userDetails.displayName}',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 25, left: 16, right: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [mfLightBlueColor, mfLightBlueGradColor],
                  ),
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: ProfileYourFundraisers(userData),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15, left: 16, right: 16),
                child: Text(
                  'My Locations',
                  style: TextStyle(
                    color: mfLettersColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ProfileLocationsWidget(locations),
              // FundsTotalAndRaised(userData),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16, top: 25),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'At a glance',
                        style: TextStyle(
                          color: mfLettersColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    BarsWidget(
                      color: mfPrimaryColor,
                      icon: Icons.person,
                      info: userData.totalFundraisers,
                      text: 'Total Fundraisers',
                    ),
                    BarsWidget(
                      color: mfLightBlueColor,
                      icon: Icons.check_circle_outlined,
                      info: userData.totalOpenFundraisers,
                      text: 'Open Fundraisers',
                    ),
                    BarsWidget(
                      color: Colors.purpleAccent,
                      icon: Icons.check_circle_outlined,
                      info: userData.totalCompletedFundraisers,
                      text: 'Completed Fundraisers',
                    ),
                    BarsWidget(
                      color: mfPrimaryColor,
                      icon: Icons.check_circle_outline_rounded,
                      info: userData.totalDraftFundraisers,
                      text: 'Draft Fundraisers',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
