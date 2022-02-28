import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';
import 'package:mfapp_mobile/providers/user_stats.dart';

import './fundraiser_fund.dart';
import '../../providers/user_stats.dart';
import '../../widgets/fundraisers/fundraisers_my_fundraisers.dart';

class FundraisersGrid extends StatefulWidget {
  final UserStats data;
  // final List<Fundraiser> data;
  // final userData;

// FundraisersGrid(this.data, this.userData);
  FundraisersGrid(this.data);

  @override
  _FundraisersGridState createState() => _FundraisersGridState();
}

class _FundraisersGridState extends State<FundraisersGrid> {
  final items = ['Active', 'Draft', 'Closed'];
  String value = 'Active';

  @override
  Widget build(BuildContext context) {
    List<UserFundraisers> newData;
    UserFundraisers latestFund;
    // List<UserFundraisers> newData;
    if (widget.data.userFundraisers.length > 0) {
      if (value == 'Active') {
        newData = widget.data.userFundraisers
            .where((i) => i.closed == false && i.draft == false)
            .toList();
      } else if (value == 'Draft') {
        newData = widget.data.userFundraisers
            .where((i) => i.closed == false && i.draft == true)
            .toList();
      } else if (value == 'Closed') {
        newData =
            widget.data.userFundraisers.where((i) => i.closed == true).toList();
      }
      // if (newData.length > 0) {
      //   newData = newData.sublist(1);
      // }
      latestFund = widget.data.userFundraisers[0];
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
                'Latest Active Fundraiser',
                style: TextStyle(
                  color: mfLettersColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (latestFund != null)
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
                child: MyFundraisers(latestFund),
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
                  child:
                      Text('There are no active Fundraisers in your account!'),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Fundraisers',
                    style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value ?? items.first,
                      focusColor: mfPrimaryColor,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ],
              ),
            ),
            newData != null && newData.length > 0
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
}
