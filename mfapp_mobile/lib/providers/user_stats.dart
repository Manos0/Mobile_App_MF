import 'package:flutter/foundation.dart';

class UserStats {
  final UserData userDetails;
  final List<UserFundraisers> userFundraisers;
  final int totalFundraisers;
  final int totalOpenFundraisers;
  final int totalCompletedFundraisers;
  final int totalFeaturedFundraisers;
  final int totalDraftFundraisers;
  final double totalGoalAmount;
  final double totalDonations;
  final double totalPayouts;

  UserStats({
    this.userDetails,
    this.userFundraisers,
    this.totalFundraisers,
    this.totalOpenFundraisers,
    this.totalCompletedFundraisers,
    this.totalFeaturedFundraisers,
    this.totalDraftFundraisers,
    this.totalGoalAmount,
    this.totalDonations,
    this.totalPayouts,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    var list = json['Fundraisers'] as List;
    List<UserFundraisers> userFundsList =
        list.map((i) => UserFundraisers.fromJson(i)).toList();
    return new UserStats(
      userDetails: UserData.fromJson(json['UserDetails']),
      userFundraisers: userFundsList,
      totalFundraisers: json['TotalFundraisers'],
      totalOpenFundraisers: json['TotalOpenFundraisers'],
      totalCompletedFundraisers: json['TotalCompletedFundraisers'],
      totalFeaturedFundraisers: json['TotalFeaturedFundraisers'],
      totalDraftFundraisers: json['TotalDraftFundraisers'],
      totalGoalAmount: json['TotalGoalAmount'],
      totalDonations: json['TotalDonations'],
      totalPayouts: json['TotalPayouts'],
    );
  }
}

class UserData {
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String email;
  final String createdOnDate;
  final String photoUrl;
  final String displayName;
  final String telephone;
  final String street;
  final String city;

  UserData({
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.email,
    this.createdOnDate,
    this.photoUrl,
    this.displayName,
    this.telephone,
    this.street,
    this.city,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return new UserData(
      userId: json['UserId'],
      userFirstName: json['FirstName'],
      userLastName: json['LastName'],
      email: json['Email'],
      createdOnDate: json['CreatedOnDate'],
      photoUrl: json['PhotoURL'],
      displayName: json['DisplayName'],
      telephone: json['Telephone'],
      street: json['Street'],
      city: json['City'],
    );
  }
}

class UserFundraisers {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String nickName;
  final String birthDate;
  final String passingDate;
  final String dateCreated;
  final String clientAvatarMD;
  final String clientAvatarSM;
  final String fundContent;
  final double goalAmount;
  final double fundRaised;

  UserFundraisers({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.birthDate,
    this.passingDate,
    this.dateCreated,
    this.clientAvatarMD,
    this.clientAvatarSM,
    this.fundContent,
    this.goalAmount,
    this.fundRaised,
  });

  factory UserFundraisers.fromJson(Map<String, dynamic> json) {
    return new UserFundraisers(
      id: json['FundraiserId'],
      firstName: json['ClientFirstName'],
      middleName: json['ClientMiddleName'],
      lastName: json['ClientLastName'],
      nickName: json['ClientNickName'],
      birthDate: json['BirthDate'],
      passingDate: json['PassingDate'],
      dateCreated: json['DateCreated'],
      clientAvatarMD: json['ClientAvatarMD'],
      clientAvatarSM: json['ClientAvatarSM'],
      fundContent: json['FundContent'],
      goalAmount: json['GoalAmount'],
      fundRaised: json['FundRaised'],
    );
  }
}
