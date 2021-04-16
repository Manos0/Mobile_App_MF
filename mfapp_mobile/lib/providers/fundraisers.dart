import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/fundraiser.dart';

class Fundraisers with ChangeNotifier {
  var fundIndex = 0;
  List<Fundraiser> _fundraiserList = [];

  final String authToken;

  Fundraisers(this.authToken);

  List<Fundraiser> get fundraiserList {
    return [..._fundraiserList];
  }

  Future<void> fetchAndSetFundraisers() async {
    final url = Uri.parse(
        'https://mfdev.t-worxsites.com/DesktopModules/sff/API/Fundraisers?take=8&skip=0&draft=true&closed=false');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    final List<Fundraiser> loadedFundraisers =
        extractedFundraisers.map((item) => Fundraiser.fromJson(item)).toList();
    _fundraiserList = loadedFundraisers;
    notifyListeners();
    print(loadedFundraisers);
  }
}
