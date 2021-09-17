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
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      childAspectRatio: 1.399,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Cubes(
          color: mfPrimaryColor,
          icon: Icons.person,
          text: 'Total \nFundraisers',
          price: data.totalFundraisers,
        ),
        Cubes(
          color: mfLightBlueColor,
          icon: Icons.check_circle_outlined,
          text: 'Open \nFundraisers',
          price: data.totalOpenFundraisers,
          //sta 8 psifia exw provlima
        ),
        Cubes(
          color: Colors.purpleAccent,
          icon: Icons.check_circle_outlined,
          text: 'Completed \nFundraisers',
          price: data.totalCompletedFundraisers,
        ),
        Cubes(
          color: mfPrimaryColor,
          icon: Icons.check_circle_outline_rounded,
          text: 'Draft \nFundraisers',
          price: data.totalDraftFundraisers,
        ),
      ],
    );
  }
}
