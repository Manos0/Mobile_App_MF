import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import './fundraiser_fund.dart';

class FundraisersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraisersList = Provider.of<Fundraisers>(context);
    final fundraisers = fundraisersList.fundraiserList;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: fundraisers.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: fundraisers[i],
        child: FundraiserFund(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            (MediaQuery.of(context).orientation == Orientation.portrait
                ? 2
                : 4),
        childAspectRatio: 4 / 7,
        crossAxisSpacing: 25,
        mainAxisSpacing: 20,
      ),
    );
  }
}
