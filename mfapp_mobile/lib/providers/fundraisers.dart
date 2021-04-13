import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mfapp_mobile/providers/fundraiser.dart';

class Fundraisers with ChangeNotifier {
  var fundIndex = 0;
  // List<Fundraiser> _funds = [];

  final String authToken;

  Fundraisers(this.authToken);

  // List<Fundraiser> get funds {
  //   return [..._funds];
  // }

  // Fundraiser findById(String id) {
  //   return _funds.firstWhere((prod) => prod.id == id);
  // }

  Future<void> fetchAndSetFundraisers() async {
    final url = Uri.parse(
        'https://mfdev.t-worxsites.com/DesktopModules/sff/API/Fundraisers?take=8&skip=0&draft=true&closed=false');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final extractedFundraisers = json.decode(response.body);
    // final List<Fundraiser> loadedFundraisers = [];
    // extractedFundraisers.forEach((fundData) {
    //   loadedFundraisers.add(Fundraiser(
    //     id: fundData['FundraiserId'],
    //     firstName: fundData['ClientFirstName'],
    //     middleName: fundData['ClientMiddleName'],
    //     lastName: fundData['ClientLastName'],
    //     nickName: fundData['ClientNickName'],
    //     goalAmount: fundData['GoalAmount'],
    //     fundRaised: fundData['FundRaised'],
    //     clientAvatarMD: fundData['ClientAvatarMD'],
    //     clientAvatarSM: fundData['ClientAvatarSM'],
    //   ));
    // });
    // _funds = extractedFundraisers;
    // notifyListeners();
    print(extractedFundraisers.length);
  }
}
// {HttpHeaders.authorizationHeader: 'Bearer ' + authToken}
