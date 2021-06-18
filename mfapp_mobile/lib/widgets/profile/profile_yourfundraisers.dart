import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../bin/functions.dart';
import '../../screens/fundraiser_detail_screen.dart';
import '../../screens/add_fundraiser/add_fundraiser_screen.dart';

class ProfileYourFundraisers extends StatelessWidget {
  final data;

  ProfileYourFundraisers(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 19, right: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14, top: 17),
            child: Text(
              'Your Fundraises',
              style: TextStyle(
                color: mfSecondaryLetterColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      primary: mfPrimaryColor40,
                      elevation: 3,
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AddFundraiserScreen.routeName);
                    },
                    child: Icon(
                      Icons.add_outlined,
                      color: mfPrimaryColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 65,
                    height: 55,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: mfPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                height: 125,
                width: MediaQuery.of(context).size.width / 1.6,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    data.userFundraisers.length,
                    (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: fundImage(
                                  data.userFundraisers[index].clientAvatarMD),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      FundraiserDetailScreen.routeName,
                                      arguments:
                                          data.userFundraisers[index].id);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              height: 50,
                              child: Text(
                                (data.userFundraisers[index].firstName
                                            .isNotEmpty
                                        ? data.userFundraisers[index].firstName
                                        : '') +
                                    (data.userFundraisers[index].middleName !=
                                                null &&
                                            data.userFundraisers[index]
                                                    .middleName.length >
                                                0
                                        ? ' ' +
                                            data.userFundraisers[index]
                                                .middleName
                                        : '') +
                                    (data.userFundraisers[index].lastName !=
                                                null &&
                                            data.userFundraisers[index].lastName
                                                    .length >
                                                0
                                        ? ' ' +
                                            data.userFundraisers[index].lastName
                                        : ''),
                                style: TextStyle(
                                  color: mfPrimaryColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
