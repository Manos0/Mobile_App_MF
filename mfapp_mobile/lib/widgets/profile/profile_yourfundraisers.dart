import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../bin/api_addresses.dart';
import '../../screens/fundraiser_detail_screen.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: List.generate(
                  data.userFundraisers.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              baseUrl +
                                  data.userFundraisers[index].clientAvatarMD,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    FundraiserDetailScreen.routeName,
                                    arguments: data.userFundraisers[index].id);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 50,
                            child: Text(
                              (data.userFundraisers[index].firstName.isNotEmpty
                                      ? data.userFundraisers[index].firstName
                                      : '') +
                                  (data.userFundraisers[index].middleName !=
                                              null &&
                                          data.userFundraisers[index].middleName
                                                  .length >
                                              0
                                      ? ' ' +
                                          data.userFundraisers[index].middleName
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
              Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: mfPrimaryColor,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: mfPrimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
