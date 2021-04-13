// import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

class Fundraiser with ChangeNotifier {
  final String id;
  final String clientAvatarMD;
  final String clientAvatarSM;
  final String firstName;
  final String middleName;
  final String lastName;
  final String nickName;
  final double goalAmount;
  final double fundRaised;

  Fundraiser({
    this.id,
    this.clientAvatarMD,
    this.clientAvatarSM,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.goalAmount,
    this.fundRaised,
  });

  factory Fundraiser.fromJson(Map<String, dynamic> json) {
    return new Fundraiser(
      id: json['FundraiserId'],
      clientAvatarMD: json[''],
    );
  }
}
