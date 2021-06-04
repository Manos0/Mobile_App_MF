import 'dart:convert';

import '../bin/api_addresses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bin/api_addresses.dart';
import '../providers/fundraiser.dart';
import '../providers/fundraiser_details.dart';
import '../providers/user_details.dart';
import '../providers/user_stats.dart';
import '../providers/specific_fundraisers.dart';

class Fundraisers with ChangeNotifier {
  // List<Fundraiser> _fundraiserList = [];
  final String authToken;

  Fundraisers(this.authToken);

  // List<Fundraiser> get fundraiserList {
  //   return [..._fundraiserList];
  // }

  Future<FundraiserDetails> findById(int id) async {
    final url = Uri.parse(baseUrl + fundDetails + id.toString());
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return FundraiserDetails.fromJson(json.decode(response.body));
  }

<<<<<<< HEAD
  Future<void> fetchAndSetFundraisers() async {
<<<<<<< HEAD
    final url = Uri.parse('https://mfdev.t-worxsites.com' + getFeatured);
=======
=======
  Future<List<Fundraiser>> fetchAndSetFundraisers() async {
>>>>>>> development
    final url = Uri.parse(baseUrl + getFeatured);
>>>>>>> development
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    return extractedFundraisers
        .map((item) => Fundraiser.fromJson(item))
        .toList();
  }

  Future<List<Fundraiser>> searchUsers(String searchTerm) async {
    final url = Uri.parse(baseUrl + searchFund + searchTerm);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    return extractedFundraisers
        .map((item) => Fundraiser.fromJson(item))
        .toList();
  }

  Future<UserDetails> getUserDetails() async {
    final url = Uri.parse(baseUrl + userDetails);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return UserDetails.fromJson(json.decode(response.body));
  }

  Future<UserStats> getUserData() async {
    final url = Uri.parse(baseUrl + userData + '3');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return UserStats.fromJson(json.decode(response.body));
  }
}
