import 'package:flutter/material.dart';
import 'package:mfapp_mobile/providers/fundraiser_details.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';

class FundraiserDetailScreen extends StatefulWidget {
  static const routeName = '/fundraiser-detail';

  @override
  _FundraiserDetailScreenState createState() => _FundraiserDetailScreenState();
}

class _FundraiserDetailScreenState extends State<FundraiserDetailScreen> {
  Future<FundraiserDetails> fundraiserDetails;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fundraiserId = ModalRoute.of(context).settings.arguments as int;
    fundraiserDetails =
        Provider.of<Fundraisers>(context).findById(fundraiserId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FundraiserDetails>(
      future: fundraiserDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.firstName);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
