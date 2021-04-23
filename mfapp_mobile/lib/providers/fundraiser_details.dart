import 'package:flutter/foundation.dart';

class FundraiserDetails with ChangeNotifier {
  final int id;
  final String clientAvatarMD;
  final String clientAvatarSM;
  final String firstName;
  final String middleName;
  final String lastName;
  final String nickName;
  final double goalAmount;
  final double fundRaised;

  FundraiserDetails({
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

  factory FundraiserDetails.fromJson(Map<String, dynamic> json) {
    return new FundraiserDetails(
      id: json['FundraiserId'],
      firstName: json['ClientFirstName'],
      middleName: json['ClientMiddleName'],
      lastName: json['ClientLastName'],
      nickName: json['ClientNickName'],
      goalAmount: json['GoalAmount'],
      fundRaised: json['FundRaised'],
      clientAvatarMD: json['ClientAvatarMD'],
      clientAvatarSM: json['ClientAvatarSM'],
    );
  }
}
