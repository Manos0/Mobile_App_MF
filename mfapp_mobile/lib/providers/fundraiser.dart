// import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

class Fundraiser with ChangeNotifier {
  final String id;
  final String clientAvatar;
  final String firstName;
  final String middleName;
  final String lastName;

  Fundraiser({
    this.id,
    this.clientAvatar,
    this.firstName,
    this.middleName,
    this.lastName,
  });
}
