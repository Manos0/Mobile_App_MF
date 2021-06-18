import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/provider.dart';
import '../../providers/locations.dart';
import '../../widgets/add_fundraiser/locations_grid.dart';

class AddFundraiserScreen extends StatefulWidget {
  static const routeName = '/add-fundraiser';
  @override
  _AddFundraiserScreenState createState() => _AddFundraiserScreenState();
}

class _AddFundraiserScreenState extends State<AddFundraiserScreen> {
  var _isInit = true;
  Future<List<Locations>> locations;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      locations =
          Provider.of<Fundraisers>(context, listen: false).fetchLocations();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Select Location',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder<List<Locations>>(
        future: locations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LocationsGrid(snapshot.data);
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Something went wrong!!!'),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
