import 'package:flutter/material.dart';
import 'package:mfapp_mobile/providers/fundraiser_details.dart';

import '../../bin/colors.dart';
import '../../providers/fundraiser_details.dart';

class EditTextFieldWidget extends StatelessWidget {
  FundraiserDetails fundDetail;
  EditTextFieldWidget({this.fundDetail});

  TextEditingController _firstName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (isExpanded) {
        fundDetail.firstName = _firstName.text;
      },
      title: Text('Edit Name:'),
      children: [
        TextField(
          onChanged: (String value) {
            fundDetail.firstName = value;
          },
          controller: _firstName,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: _firstName.text,
            labelText: fundDetail.firstName,
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
