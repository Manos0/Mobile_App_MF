import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fundraisers with ChangeNotifier {
  final String authToken;

  Fundraisers(this.authToken);

  Future<void> fetchAndSetFundraisers() async {
    final url = Uri.parse(
        'https://mfdev.t-worxsites.com/DesktopModules/sff/API/Fundraisers?take=8&skip=0&draft=true&closed=false');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final fundraisers = json.decode(response.body);
    print(json.decode(fundraisers));
  }
}
// {HttpHeaders.authorizationHeader: 'Bearer ' + authToken}
