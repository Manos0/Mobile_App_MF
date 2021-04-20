import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/fundraiser_detail_screen.dart';
import '../providers/fundraiser.dart';
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
            Navigator.of(context).pushNamed(FundraiserDetailScreen.routeName);
          },
          child: Image.network(
            'https://mfdev.t-worxsites.com' + fundraiser.clientAvatarSM,
            fit: BoxFit.cover,
          ),
          // child: Image.network(
          //   'https://mfdev.t-worxsites.com/Portals/0/Users/003/03/3/-1/Small/Test_TimeZone_73a6ef47-a296-4df8-9c12-4a7a34653b27.jpg',
          //   fit: BoxFit.cover,
          // ),
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
