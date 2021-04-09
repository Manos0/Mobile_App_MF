import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';

class FundraisersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraisersData = Provider.of<Fundraisers>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (ctx, i) => FundraisersGrid(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
    );
  }
}
