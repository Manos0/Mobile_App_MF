import 'package:flutter/foundation.dart';

class Fundraiser with ChangeNotifier {
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
  final List<Payment> payment;

  Fundraiser({
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
    this.payment,
  });

  factory Fundraiser.fromJson(Map<String, dynamic> json) {
    var list = json['Payments'] as List;
    List<Payment> paymentList = list.map((i) => Payment.fromJson(i)).toList();
    return new Fundraiser(
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
      payment: paymentList,
    );
  }
}

class Payment {
  final int paymentId;
  final double paymentAmount;
  final String paymentPaymentDate;
  final int paymentPaymentStatus;
  final int paymentPaymentType;

  Payment({
    this.paymentId,
    this.paymentAmount,
    this.paymentPaymentDate,
    this.paymentPaymentStatus,
    this.paymentPaymentType,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return new Payment(
      paymentId: json['PaymentId'],
      paymentAmount: json['DonationAmount'],
      paymentPaymentDate: json['PaymentDate'],
      paymentPaymentStatus: json['PaymentStatus'],
      paymentPaymentType: json['PaymentType'],
    );
  }
}
