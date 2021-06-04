import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../providers/fundraiser_details.dart';
import '../widgets/fundraisers/fundraisers_details_view.dart';
import '../providers/fundraiser.dart';
import '../widgets/fundraisers/fundraisers_grid.dart';
import '../widgets/fundraisers/search_results.dart';

class SearchResultsFundraisers extends StatefulWidget {
  static const routeName = '/search-results';

  @override
  _SearchResultsFundraisersState createState() =>
      _SearchResultsFundraisersState();
}

class _SearchResultsFundraisersState extends State<SearchResultsFundraisers> {
  Future<List<Fundraiser>> searchresults;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final searchTerm = ModalRoute.of(context).settings.arguments as String;
    searchresults = Provider.of<Fundraisers>(context).searchUsers(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Fundraiser>>(
      future: searchresults,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SearchResults(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
//Mporw na ton pigenw se diaforetiki alla paromia selida kai oxi sto
//FundraiserGrid gia na tin kanw pio omorfi!
