import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/fundraiser.dart';
import '../screens/fundraisers_screen.dart';
import '../providers/fundraisers.dart';
import '../widgets/fundraisers_grid.dart';

class FundraiserFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              FundraisersScreen.routeName,
              arguments: fundraiser.id,
            );
          },
          child: Image.network(
            'https://mfdev.t-worxsites.com' + fundraiser.clientAvatarMD,
            fit: BoxFit.cover,
          ),
        ),
        footer: Text(
          (fundraiser.firstName.isNotEmpty ? fundraiser.firstName : '') +
              (fundraiser.nickName != null && fundraiser.nickName.length > 0
                  ? ' "' + fundraiser.nickName + '"'
                  : '') +
              (fundraiser.middleName != null && fundraiser.middleName.length > 0
                  ? ' ' + fundraiser.middleName
                  : '') +
              (fundraiser.lastName != null && fundraiser.lastName.length > 0
                  ? ' ' + fundraiser.lastName
                  : ''),
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
