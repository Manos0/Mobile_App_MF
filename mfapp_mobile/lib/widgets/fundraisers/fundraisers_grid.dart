import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';
import 'package:mfapp_mobile/providers/user_stats.dart';
import 'package:provider/provider.dart';

import './fundraiser_fund.dart';
import './fundraiser_searchbar.dart';
import '../../providers/user_stats.dart';
import '../../providers/fundraiser.dart';
import '../../widgets/fundraisers/fundraisers_my_fundraisers.dart';

class FundraisersGrid extends StatelessWidget {
  final List<Fundraiser> data;
  final userData;

  FundraisersGrid(this.data, this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FundraiserSearchbar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              'My Fundraisers',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6.5,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
              color: mfLightGreen,
            ),
            child: FutureBuilder<UserStats>(
              future: userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MyFundraisers(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
            child: Text(
              'Trending Fundraisers',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: data[i],
                child: FundraiserFund(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4),
                childAspectRatio: MediaQuery.of(context).size.height < 684
                    ? MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height /
                        0.945
                    : MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height /
                        0.88,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
