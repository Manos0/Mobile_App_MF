import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../screens/add_fundraiser/add_fundraiser_screen.dart';

class AddFundraiserButton extends StatelessWidget {
  // const AddFundraiserButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        // elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: mfPrimaryColor),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, AddFundraiserScreen.routeName);
      },
      icon: Icon(
        Icons.add_circle_outline_rounded,
        color: mfPrimaryColor,
      ),
      label: Text(
        'Add a Fundraiser',
        style: TextStyle(
          color: mfPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
