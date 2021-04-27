import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../providers/fundraiser_details.dart';
import '../widgets/fundraisers_details_view.dart';

class FundraiserDetailScreen extends StatefulWidget {
  static const routeName = '/fundraiser-detail';

  @override
  _FundraiserDetailScreenState createState() => _FundraiserDetailScreenState();
}

class _FundraiserDetailScreenState extends State<FundraiserDetailScreen> {
  // Future<FundraiserDetails> fundraiserDetails;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final fundraiserId = ModalRoute.of(context).settings.arguments as int;
  //   fundraiserDetails =
  //       Provider.of<Fundraisers>(context).findById(fundraiserId);
  // }
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final fundraiserId = ModalRoute.of(context).settings.arguments as int;
      Provider.of<Fundraisers>(context).findById(fundraiserId);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FundraisersDetailsView(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<FundraiserDetails>(
  //     future: fundraiserDetails,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data.firstName);
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       }
  //       return CircularProgressIndicator();
  //     },
  //   );
  // }
}
