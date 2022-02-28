import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';
import 'package:mfapp_mobile/providers/user_stats.dart';
import 'package:provider/provider.dart';

import './fundraiser_fund.dart';
import '../../providers/user_stats.dart';
import '../../providers/fundraiser.dart';
import '../../widgets/fundraisers/fundraisers_my_fundraisers.dart';

class FundraisersGrid extends StatelessWidget {
  final UserStats data;
  // final List<Fundraiser> data;
  // final userData;

// FundraisersGrid(this.data, this.userData);
  FundraisersGrid(this.data);

  @override
  Widget build(BuildContext context) {
    List<UserFundraisers> newData;
    if (data.userFundraisers.length > 0) {
      newData = data.userFundraisers.sublist(1);
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color2],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
              child: Text(
                'Latest Fundraiser',
                style: TextStyle(
                  color: mfLettersColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (data.userFundraisers.length > 0)
              Container(
                height: (MediaQuery.of(context).size.height < 684
                    ? MediaQuery.of(context).size.height / 5.5
                    : MediaQuery.of(context).size.height / 6.5),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [mfLightBlueColor, mfLightBlueGradColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: MyFundraisers(data),
              )
            else
              Container(
                height: (MediaQuery.of(context).size.height < 684
                    ? MediaQuery.of(context).size.height / 5.5
                    : MediaQuery.of(context).size.height / 6.5),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [mfLightBlueColor, mfLightBlueGradColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Text('No Fundraisers, create your first Fundraiser!'),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
              child: Text(
                'My Fundraisers',
                style: TextStyle(
                  color: mfLettersColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            newData != null
                ? Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      shrinkWrap: true,
                      itemCount: newData.length,
                      itemBuilder: (ctx, i) {
                        return FundraiserFund(
                          widgetData: newData,
                          i: i,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 2
                            : 4),
                        childAspectRatio:
                            MediaQuery.of(context).size.height < 684
                                ? MediaQuery.of(context).size.width /
                                    MediaQuery.of(context).size.height /
                                    0.945
                                : MediaQuery.of(context).size.width /
                                    MediaQuery.of(context).size.height /
                                    0.90,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
