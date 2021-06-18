import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../bin/api_addresses.dart';
import '../providers/fundraiser.dart';
import '../providers/fundraiser_details.dart';
import '../providers/user_details.dart';
import '../providers/user_stats.dart';
import '../providers/locations.dart';

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

  Future<List<Fundraiser>> fetchAndSetFundraisers() async {
    final url = Uri.parse(baseUrl + getFeatured);
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
    final url = Uri.parse(baseUrl + userData + '30');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return UserStats.fromJson(json.decode(response.body));
  }

  Future<List<Locations>> fetchLocations() async {
    final url = Uri.parse(baseUrl + locations);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedLocations = json.decode(response.body);
    return extractedLocations.map((item) => Locations.fromJson(item)).toList();
  }
}
