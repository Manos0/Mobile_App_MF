import 'package:flutter/material.dart';

import '../../bin/colors.dart';

class EditNamesDatesGoalWidget extends StatefulWidget {
  String firstName;
  String nickName;
  String middleName;
  String lastName;
  String dateOfBirth;
  String dateOfPassing;
  double goalAmount;
  String expDate;

  @override
  _EditNamesDatesGoalWidgetState createState() =>
      _EditNamesDatesGoalWidgetState();
}

class _EditNamesDatesGoalWidgetState extends State<EditNamesDatesGoalWidget> {
  TextEditingController _liveStreamingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (String value) {},
          controller: _liveStreamingController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: mfLightGrey,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(7),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black26,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(7),
              ),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: mfPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
      ],
    );
  }
}
