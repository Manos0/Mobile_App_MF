import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../bin/functions.dart';
import '../../providers/user_stats.dart';
import '../../screens/fundraiser_detail_screen.dart';
import '../../screens/add_fundraiser/add_fundraiser_screen.dart';

class ProfileYourFundraisers extends StatelessWidget {
  UserStats data;

  ProfileYourFundraisers(this.data);

  @override
  Widget build(BuildContext context) {
    List<UserFundraisers> newData =
        data.userFundraisers.where((i) => i.closed == true).toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 15),
            child: Text(
              'Your Active Fundraises',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          shadowColor: Colors.black12,
                          padding: EdgeInsets.all(12),
                          primary: mfPrimaryColor40,
                          elevation: 5,
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AddFundraiserScreen.routeName);
                        },
                        child: Icon(
                          Icons.add_sharp,
                          color: mfPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 9),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: mfLightlightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 36,
                    ),
                  ],
                ),
              ),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width / 1.42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    newData.length,
                    (index) {
                      return Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: ClipOval(
                                child: FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/images/MF-App-Loader.gif'),
                                  image: yourfundImage(
                                      newData[index].clientAvatarMD),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    FundraiserDetailScreen.routeName,
                                    arguments: newData[index].id);
                              },
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  if (newData[index].firstName != null &&
                                      newData[index].firstName.isNotEmpty)
                                    Text(
                                      newData[index].firstName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  if (newData[index].middleName != null &&
                                      newData[index].middleName.isNotEmpty)
                                    Text(
                                      newData[index].middleName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  if (newData[index].lastName != null &&
                                      newData[index].lastName.isNotEmpty)
                                    Text(
                                      newData[index].lastName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
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
