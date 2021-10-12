import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class NewFundraiser with ChangeNotifier {
  int id;
  String clientAvatar;
  String clientAvatar64;
  File galleryImage;
  int locationId;
  String firstName;
  String middleName;
  String lastName;
  String nickName;
  String birthDate;
  String passingDate;
  double goalAmount;
  String dateCreated;
  String expirationDate;
  String obituary;
  int textSelection;
  bool author;
  String authorName;
  String eventTime;
  String eventDate;
  String gender;
  double fundRaised;
  bool template;
  bool draft;
  bool active;
  bool mfvisibility;
  NewFundLocation fundLocation;
  FuneralService funeralService;
  List<Contacts> contacts;

  NewFundraiser({
    this.id,
    this.clientAvatar,
    this.clientAvatar64,
    this.galleryImage,
    this.locationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.birthDate,
    this.passingDate,
    this.goalAmount,
    this.dateCreated,
    this.expirationDate,
    this.obituary,
    this.fundRaised,
    this.fundLocation,
    this.template,
    this.contacts,
    this.active,
    this.draft,
    this.mfvisibility,
    this.funeralService,
    this.textSelection,
    this.gender,
    this.author,
    this.authorName,
    this.eventDate,
    this.eventTime,
  });
}

class NewFundLocation {
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

  NewFundLocation({
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
}

class Contacts {
  String image;
  String image64;
  int contactType;
  String firstName;
  String lastName;
  String relationship;
  String email;
  String phoneNumber;
  File contactImage;

  Contacts({
    this.image,
    this.image64,
    this.contactType,
    this.firstName,
    this.lastName,
    this.relationship,
    this.email,
    this.phoneNumber,
    this.contactImage,
  });
  Map<String, dynamic> toJson() {
    return {
      "Image": {"Name": this.image, "ImageData": this.image64},
      "FirstName": this.firstName,
      "LastName": this.lastName,
      "Relationship": this.relationship,
      "PrimaryPhone": this.phoneNumber,
      "Email": this.email,
      "Type": this.contactType
    };
  }
}

class FuneralService {
  String venueName;
  String venuePhoneNumber;
  var venueAddress;
  String venueCity;
  String venueState;
  String venueZipCode;
  String venueDate;
  String venueTime;
  String venueAdditionalInfo;
  String venueWebCast;
  String service;

  FuneralService({
    this.venueName,
    this.venuePhoneNumber,
    this.venueAddress,
    this.venueCity,
    this.venueState,
    this.venueZipCode,
    this.venueDate,
    this.venueTime,
    this.venueAdditionalInfo,
    this.venueWebCast,
    this.service,
  });
}
