import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';

import '../../screens/search_results_fundraisers.dart';

class FundraiserSearchbar extends StatelessWidget {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Icon(
                    Icons.search_rounded,
                    color: mfLettersColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Fundraisers',
                      hintStyle: TextStyle(
                          color: mfSecondaryLetterColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    controller: searchController,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: mfLettersColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    SearchResultsFundraisers.routeName,
                    arguments: searchController.text);
              },
            ),
          ],
        ));
  }
}
