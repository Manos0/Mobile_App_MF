import 'package:flutter/material.dart';

import '../../../bin/colors.dart';

class SelectedLocationWidget extends StatelessWidget {
  final String locationName;

  SelectedLocationWidget(this.locationName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: mfPrimaryColor,
        // ),
        color: mfLightBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        locationName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 3,
        softWrap: true,
      ),
    );
  }
}
