import 'package:flutter/material.dart';

class FundraiserDetailScreen extends StatelessWidget {
  static const routeName = '/fundraiser-detail';
  @override
  Widget build(BuildContext context) {
    final fundraiserId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
