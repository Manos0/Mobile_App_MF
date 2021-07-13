import 'package:flutter/material.dart';
import 'package:mfapp_mobile/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import './fundraiser_fund.dart';
import '../../providers/fundraiser.dart';

class SearchResults extends StatelessWidget {
  final List<Fundraiser> data;

  SearchResults(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Search Results',
          style: TextStyle(
            color: Color.fromRGBO(23, 33, 42, 1),
            fontSize: 20,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            // Navigator.of(context).popAndPushNamed(TabsScreen.routeName);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FundraiserSearchbar(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: data.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: data[i],
                child: FundraiserFund(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4),
                childAspectRatio: MediaQuery.of(context).size.height < 684
                    ? MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height /
                        0.945
                    : MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height /
                        0.86,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
