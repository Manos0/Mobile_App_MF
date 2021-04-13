import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
// import '../widgets/fundraisers_grid.dart';

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
    // final loadedFundraisers = Provider.of<Fundraisers>(context, listen: false)
    //     .fetchAndSetFundraisers();
    return Scaffold(
        // body: GridView.builder(
        //   padding: const EdgeInsets.all(10.0),
        //   itemBuilder: (ctx, i) => FundraisersGrid(),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 1 / 2,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 10,
        //   ),
        // ),
        );
  }
}
