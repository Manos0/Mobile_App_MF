import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../widgets/fundraisers_grid.dart';

class FundraisersScreen extends StatefulWidget {
  static const routeName = '/fundraisers';

  @override
  _FundraisersScreenState createState() => _FundraisersScreenState();
}

class _FundraisersScreenState extends State<FundraisersScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Fundraisers>(context).fetchAndSetFundraisers();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final fundraiserList = Provider.of<Fundraisers>(context, listen: false)
    //     .fetchAndSetFundraisers();
    // final fundraisersList = Provider.of<Fundraisers>(context);
    // final fundraisers = fundraisersList.fundraiserList;
    // print(fundraisers);
    return Scaffold(
      body: FundraisersGrid(),
    );
  }
}
