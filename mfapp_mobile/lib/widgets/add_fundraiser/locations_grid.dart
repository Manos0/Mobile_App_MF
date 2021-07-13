import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/locations.dart';

import '../../widgets/add_fundraiser/locations_cards.dart';

class LocationsGrid extends StatefulWidget {
  final List<Locations> locationsData;

  LocationsGrid(this.locationsData);
  // const LocationsGrid({ Key? key }) : super(key: key);

  @override
  _LocationsGridState createState() => _LocationsGridState();
}

class _LocationsGridState extends State<LocationsGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: widget.locationsData.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: widget.locationsData[i],
          child: LocationsCards(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
