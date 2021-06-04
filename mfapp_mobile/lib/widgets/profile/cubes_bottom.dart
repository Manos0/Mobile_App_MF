import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../widgets/profile/cubes.dart';

class BottomCubes extends StatelessWidget {
  final data;

  BottomCubes(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2 / 1.7,
      children: [
        Cubes(
          color: mfPrimaryColor,
          icon: Icons.check_circle_outlined,
          text: 'Total Fundraisers',
          price: data.totalFundraisers,
        ),
        Cubes(
          color: mfLightBlueColor,
          icon: Icons.timer,
          text: 'Total Open Fundraisers',
          price: data.totalOpenFundraisers,
        ),
        Cubes(
          color: Colors.purpleAccent,
          icon: Icons.lock_clock,
          text: 'Completed Fundraisers',
          price: data.totalCompletedFundraisers,
        ),
        Cubes(
          color: mfPrimaryColor,
          icon: Icons.check_circle_outline_rounded,
          text: 'Draft Fundraisers',
          price: data.totalDraftFundraisers,
        ),
      ],
    );
  }
}
