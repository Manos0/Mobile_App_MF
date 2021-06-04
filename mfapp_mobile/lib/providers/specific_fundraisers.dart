import 'package:flutter/foundation.dart';

class SpecificFundraisers with ChangeNotifier {
  final int id;
  final String clientAvatarMD;
  final String clientAvatarSM;
  final String firstName;
  final String middleName;
  final String lastName;
  final String nickName;
  final double goalAmount;
  final String dateCreated;
  final double fundRaised;

  SpecificFundraisers({
    this.id,
    this.clientAvatarMD,
    this.clientAvatarSM,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.goalAmount,
    this.dateCreated,
    this.fundRaised,
  });

  factory SpecificFundraisers.fromJson(Map<String, dynamic> json) {
    return new SpecificFundraisers(
      id: json['FundraiserId'],
      firstName: json['ClientFirstName'],
      middleName: json['ClientMiddleName'],
      lastName: json['ClientLastName'],
      nickName: json['ClientNickName'],
      goalAmount: json['GoalAmount'],
      dateCreated: json['DateCreated'],
      fundRaised: json['FundRaised'],
      clientAvatarMD: json['ClientAvatarMD'],
      clientAvatarSM: json['ClientAvatarSM'],
    );
  }
}
