import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/fundraiser.dart';
import '../../providers/provider.dart';
import './fundraisers_search_results.dart';

class SearchResults extends StatelessWidget {
  final List<Fundraiser> data;

  SearchResults(this.data);

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<Fundraisers>(context);
    final userId = userInfo.userD.userId;
    var newData = data.where((item) => item.userId == userId).toList();
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
        child: newData.length > 0 && newData != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: newData.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: data[i],
                        child: FundraisersSearchResults(),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 2
                            : 4),
                        childAspectRatio:
                            MediaQuery.of(context).size.height < 684
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
              )
            : Center(
                child: Text(
                  'No Results',
                  style: TextStyle(
                    color: mfLettersColor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
