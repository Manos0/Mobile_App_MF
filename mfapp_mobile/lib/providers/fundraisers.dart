import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bin/api_addresses.dart';
import '../providers/fundraiser.dart';

class Fundraisers with ChangeNotifier {
  List<Fundraiser> _fundraiserList = [];

  final String authToken;

  Fundraisers(this.authToken);

  List<Fundraiser> get fundraiserList {
    return [..._fundraiserList];
  }

  // Fundraiser findById(int id) {
  //   return _fundraiserList.firstWhere((fund) => fund.id == id);
  // }

  Future<void> findById(int id) async {
    final url = Uri.parse(baseUrl + fundDetails + id.toString());
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(json.decode(response.body));
    print(extractedData);
  }

  Future<void> fetchAndSetFundraisers() async {
    final url = Uri.parse(baseUrl + getFeatured);
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
