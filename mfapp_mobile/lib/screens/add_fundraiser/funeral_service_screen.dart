import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../providers/new_fundraiser.dart';
import '../../widgets/add_fundraiser/funeral_service_form.dart';

class FuneralServiceScreen extends StatelessWidget {
  static const routeName = '/funeral-service';

  @override
  Widget build(BuildContext context) {
    final newFund = ModalRoute.of(context).settings.arguments as NewFundraiser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(color: mfLightGrey),
        title: Text(
          'Funeral Service',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color2],
          ),
        ),
        child: FuneralServiceForm(data: newFund),
      ),
    );
  }
}
