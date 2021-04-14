import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mfapp_mobile/providers/fundraiser.dart';

class Fundraisers with ChangeNotifier {
  var fundIndex = 0;
  // List<Fundraiser> _funds = [];

  final String authToken;

  Fundraisers(this.authToken);

  // List<Fundraiser> get fundraiserList {}

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
    final List extractedFundraisers = json.decode(response.body);
    final List<Fundraiser> fundraiserList =
        extractedFundraisers.map((item) => Fundraiser.fromJson(item)).toList();
    print(fundraiserList);
    return fundraiserList;
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
    // print(fundraiserList);
  }
}

// // {HttpHeaders.authorizationHeader: 'Bearer ' + authToken}
// class fundraisersList {
//   final List<Fundraiser> fundraisers;

//   fundraisersList ({
//     this.fundraisers,
//   });
// }
// factory fundraisersList.fromJson(List<dynamic> parsedJson) {
//  fundraiser = parsedJson.map((i)=>Fundraisers.fromJson(i)).toList();
//     List<Fundraisers> fundraiser = new List<Fundraisers>();

//     return new fundraisersList(
//        fundraiser : fundraiser ,
//     );
//   }
