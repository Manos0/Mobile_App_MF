import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/fundraiser.dart';

class FundraiserFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fundraiser = Provider.of<Fundraiser>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Image.network(
            fundraiser.clientAvatarMD,
            fit: BoxFit.cover,
          ),
        ),
        footer: Text(
          fundraiser.firstName,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
