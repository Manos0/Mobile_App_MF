import 'package:flutter/foundation.dart';

class Locations with ChangeNotifier {
  final int id;
  final String stripeAccountId;
  final int userId;
  final String name;
  final String email;
  final String phoneNumber;
  final String address1;
  final String address2;
  final String city;
  final int state;
  final String postalCode;
  final int country;
  final String taxId;
  final String website;
  final String logo;
  final String stripeRequirements;
  final bool chargesEnabled;
  final bool payoutsEnabled;
  final String dateCreated;
  // final int hLAccountId;
  // final String hLAccountApi;
  // final int hLSuccessCampaignId;
  // final int hLFailedCampaignId;
  // final int hLFailedReminderCampaignId;
  // final int hLFundFormComplCampaignId;
  // final List representatives;
  // final List bankAccounts;
  final String image;

  Locations({
    this.id,
    this.stripeAccountId,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.taxId,
    this.website,
    this.logo,
    this.stripeRequirements,
    this.chargesEnabled,
    this.payoutsEnabled,
    this.dateCreated,
    // this.hLAccountId,
    // this.hLAccountApi,
    // this.hLSuccessCampaignId,
    // this.hLFailedCampaignId,
    // this.hLFailedReminderCampaignId,
    // this.hLFundFormComplCampaignId,
    // this.representatives,
    // this.bankAccounts,
    this.image,
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    // var list1 = json['Representatives'] as List;
    // var list2 = json['BankAccounts'] as List;
    return new Locations(
      id: json['LocationId'],
      stripeAccountId: json['StripeAccountId'],
      userId: json['UserId'],
      name: json['Name'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      address1: json['Address1'],
      address2: json['Address2'],
      city: json['City'],
      state: json['State'],
      postalCode: json['PostalCode'],
      country: json['Country'],
      taxId: json['TaxId'],
      website: json['Website'],
      logo: json['Logo'],
      stripeRequirements: json['StripeRequirements'],
      chargesEnabled: json['ChargesEnabled'],
      payoutsEnabled: json['PayoutsEnabled'],
      dateCreated: json['DateCreated'],
      // hLAccountId: json['HLAccountId'],
      // hLAccountApi: json['HLAccountApi'],
      // hLSuccessCampaignId: json['HLSuccessCampaignId'],
      // hLFailedCampaignId: json['HLFailedCampaignId'],
      // hLFailedReminderCampaignId: json['HLFailedReminderCampaignId'],
      // hLFundFormComplCampaignId: json['HLFundFormComplCampaignId'],
      // representatives: list1,
      // bankAccounts: list2,
      image: json['Image'],
    );
  }
}
