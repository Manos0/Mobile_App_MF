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
  final String fundContent;
  final String birthDate;
  final String passingDate;
  final Location location;
  final List<Payment> payment;

  FundraiserDetails({
    this.id,
    this.clientAvatarMD,
    this.clientAvatarSM,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.fundContent,
    this.goalAmount,
    this.fundRaised,
    this.birthDate,
    this.passingDate,
    this.location,
    this.payment,
  });

  factory FundraiserDetails.fromJson(Map<String, dynamic> json) {
    var list = json['Payments'] as List;
    List<Payment> paymentList = list.map((i) => Payment.fromJson(i)).toList();
    return new FundraiserDetails(
      id: json['FundraiserId'],
      firstName: json['ClientFirstName'],
      middleName: json['ClientMiddleName'],
      lastName: json['ClientLastName'],
      nickName: json['ClientNickName'],
      fundContent: json['FundContent'],
      goalAmount: json['GoalAmount'],
      fundRaised: json['FundRaised'],
      clientAvatarMD: json['ClientAvatarMD'],
      clientAvatarSM: json['ClientAvatarSM'],
      birthDate: json['BirthDate'],
      passingDate: json['PassingDate'],
      location: Location.fromJson(json['Location']),
      payment: paymentList,
    );
  }
}

class Location {
  final int locationId;
  final String locationName;
  final String locationEmail;
  final String locationPhone;
  final String locationAddress1;
  final String locationAddress2;
  final String locationCity;
  final String locationPostalCode;
  final int locationState;
  final String locationLogo;

  Location({
    this.locationId,
    this.locationName,
    this.locationEmail,
    this.locationPhone,
    this.locationAddress1,
    this.locationAddress2,
    this.locationCity,
    this.locationPostalCode,
    this.locationState,
    this.locationLogo,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return new Location(
      locationId: json['LocationId'],
      locationName: json['Name'],
      locationEmail: json['Email'],
      locationPhone: json['PhoneNumber'],
      locationAddress1: json['Address1'],
      locationAddress2: json['Address2'],
      locationCity: json['City'],
      locationPostalCode: json['PostalCode'],
      locationState: json['State'],
      locationLogo: json['Logo'],
    );
  }
}

class Payment with ChangeNotifier {
  final int paymentId;
  final String paymentFirstName;
  final String paymentLastName;
  final String paymentComment;
  final String paymentEmail;
  final double paymentAmount;
  final String paymentCurrency;
  final bool paymentAnonymous;
  final bool paymentHideName;
  final bool paymentHideContribution;
  final String paymentCompanyName;
  final bool paymentInMemoryOf;
  final bool paymentInHonorOf;
  final String paymentTributeFirstName;
  final String paymentTributeLastName;
  final String paymentPaymentDate;
  final int paymentPaymentStatus;
  final int paymentPaymentType;

  Payment({
    this.paymentId,
    this.paymentFirstName,
    this.paymentLastName,
    this.paymentComment,
    this.paymentEmail,
    this.paymentAmount,
    this.paymentCurrency,
    this.paymentAnonymous,
    this.paymentHideName,
    this.paymentHideContribution,
    this.paymentCompanyName,
    this.paymentInMemoryOf,
    this.paymentInHonorOf,
    this.paymentTributeFirstName,
    this.paymentTributeLastName,
    this.paymentPaymentDate,
    this.paymentPaymentStatus,
    this.paymentPaymentType,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return new Payment(
      paymentId: json['PaymentId'],
      paymentFirstName: json['FirstName'],
      paymentLastName: json['LastName'],
      paymentComment: json['Comment'],
      paymentEmail: json['Email'],
      paymentAmount: json['DonationAmount'],
      paymentCurrency: json['Currency'],
      paymentAnonymous: json['Anonymous'],
      paymentHideName: json['HideName'],
      paymentHideContribution: json['HideContribution'],
      paymentCompanyName: json['CompanyName'],
      paymentInMemoryOf: json['InMemoryOf'],
      paymentInHonorOf: json['InHonorOf'],
      paymentTributeFirstName: json['TributeFirstName'],
      paymentTributeLastName: json['TributeLastName'],
      paymentPaymentDate: json['PaymentDate'],
      paymentPaymentStatus: json['PaymentStatus'],
      paymentPaymentType: json['PaymentType'],
    );
  }
}
