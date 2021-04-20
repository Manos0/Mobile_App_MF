import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';

class FundraiserDetailScreen extends StatelessWidget {
  static const routeName = '/fundraiser-detail';
  @override
  Widget build(BuildContext context) {
    final fundraiserId = ModalRoute.of(context).settings.arguments as int;
    // final loadedFundraiser = Provider.of<Fundraisers>(
    //   context,
    //   listen: false,
    // ).findById(fundraiserId);
    final loadedFundraiser =
        Provider.of<Fundraisers>(context).findById(fundraiserId);
    print(fundraiserId);
    print(loadedFundraiser);
    return Scaffold(
      appBar: AppBar(
        title: Text('loadedFundraiser.firstName'),
      ),
    );
  }
}
