import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/fundraiser.dart';
import './fundraisers_search_results.dart';

class SearchResults extends StatelessWidget {
  final List<Fundraiser> data;

  SearchResults(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        title: Text(
          'Search Results',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pop(context);
            // Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color2],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FundraiserSearchbar(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: data.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: data[i],
                  child: FundraisersSearchResults(),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? 2
                      : 4),
                  childAspectRatio: MediaQuery.of(context).size.height < 684
                      ? MediaQuery.of(context).size.width /
                          MediaQuery.of(context).size.height /
                          0.945
                      : MediaQuery.of(context).size.width /
                          MediaQuery.of(context).size.height /
                          0.90,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
