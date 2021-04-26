import 'dart:convert';

import '../bin/api_addresses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bin/api_addresses.dart';
import '../providers/fundraiser.dart';
import '../providers/fundraiser_details.dart';

class Fundraisers with ChangeNotifier {
  List<Fundraiser> _fundraiserList = [];

  final String authToken;

  Fundraisers(this.authToken);

  List<Fundraiser> get fundraiserList {
    return [..._fundraiserList];
  }

  Future<FundraiserDetails> findById(int id) async {
    final url = Uri.parse(baseUrl + fundDetails + id.toString());
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return FundraiserDetails.fromJson(json.decode(response.body));
  }

  Future<void> fetchAndSetFundraisers() async {
<<<<<<< HEAD
    final url = Uri.parse('https://mfdev.t-worxsites.com' + getFeatured);
=======
    final url = Uri.parse(baseUrl + getFeatured);
>>>>>>> development
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    final List<Fundraiser> loadedFundraisers =
        extractedFundraisers.map((item) => Fundraiser.fromJson(item)).toList();
    _fundraiserList = loadedFundraisers;
    notifyListeners();
  }
}
