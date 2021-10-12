import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io';

class FundraiserDetails with ChangeNotifier {
  final int id;
  String firstName;
  String middleName;
  String lastName;
  String nickName;
  String birthDate;
  String passingDate;
  String expirationDate;
  String clientAvatar;
  String clientAvatar64;
  String clientAvatarMD;
  String clientAvatarSM;
  String fundContent;
  double goalAmount;
  bool draft;
  bool template;
  String liveWebcast;
  String templateOptions;
  String funeralService;
  final double fundRaised;
  final Location location;
  final List<Payment> payment;
  int textSelection;
  bool author;
  String authorname;
  String eventTime;
  String eventDate;
  String gender;
  String venueName;
  String venuePhoneNumber;
  String venueAddress;
  String venueCity;
  String venueState;
  String venueZipCode;
  String venueTime;
  String venueDate;
  String venueAdditionalInfo;
  List<EditContacts> contactList;

  FundraiserDetails({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickName,
    this.birthDate,
    this.passingDate,
    this.expirationDate,
    this.clientAvatar,
    this.clientAvatar64,
    this.clientAvatarMD,
    this.clientAvatarSM,
    this.fundContent,
    this.goalAmount,
    this.fundRaised,
    this.location,
    this.draft,
    this.template,
    this.templateOptions,
    this.funeralService,
    this.liveWebcast,
    this.payment,
    this.textSelection,
    this.author,
    this.authorname,
    this.eventTime,
    this.eventDate,
    this.gender,
    this.venueName,
    this.venuePhoneNumber,
    this.venueAddress,
    this.venueCity,
    this.venueState,
    this.venueZipCode,
    this.venueTime,
    this.venueDate,
    this.venueAdditionalInfo,
    this.contactList,
  });

  factory FundraiserDetails.fromJson(Map<String, dynamic> json) {
    var listOfContacts = json['Contacts'] as List;
    List<EditContacts> userContacts =
        listOfContacts.map((i) => EditContacts.fromJson(i)).toList();
    var list = json['Payments'] as List;
    List<Payment> paymentList = list.map((i) => Payment.fromJson(i)).toList();
    var options = jsonDecode(json['TemplateOptions']);
    var service = jsonDecode(json['FuneralService']);
    return new FundraiserDetails(
      id: json['FundraiserId'],
      firstName: json['ClientFirstName'],
      middleName: json['ClientMiddleName'],
      lastName: json['ClientLastName'],
      nickName: json['ClientNickName'],
      birthDate: json['BirthDate'],
      passingDate: json['PassingDate'],
      expirationDate: json['ExpirationDate'],
      clientAvatar: json['ClientAvatar'],
      clientAvatarMD: json['ClientAvatarMD'],
      clientAvatarSM: json['ClientAvatarSM'],
      fundContent: json['FundContent'],
      goalAmount: json['GoalAmount'],
      fundRaised: json['FundRaised'],
      draft: json['Draft'],
      liveWebcast: json['LiveWebcast'],
      template: json['Template'],
      templateOptions: json['TemplateOptions'],
      location: Location.fromJson(json['Location']),
      payment: paymentList,
      textSelection: options['textSelection'],
      author: options['author'],
      authorname: options['authorName'],
      eventTime: options['eventTime'],
      eventDate: options['eventDate'],
      gender: options['gender'],
      venueName: service['Venue'],
      venuePhoneNumber: service['VenuePhoneNumber'],
      venueAddress: service['Address'],
      venueCity: service['City'],
      venueState: service['State'],
      venueZipCode: service['ZipCode'],
      venueTime: service['Time'],
      venueDate: service['Date'],
      venueAdditionalInfo: service['AdditionalInfo'],
      contactList: userContacts,
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

class EditContacts {
  int contactId;
  int fundraiserId;
  String contactFirstName;
  String contactLastName;
  String contactRelationship;
  String contactPhone;
  String contactEmail;
  int contactType;
  String contactPhoto;
  File contactFileImage;
  String contactImage;

  EditContacts({
    this.contactId,
    this.fundraiserId,
    this.contactFirstName,
    this.contactLastName,
    this.contactRelationship,
    this.contactPhone,
    this.contactEmail,
    this.contactType,
    this.contactPhoto,
    this.contactImage,
  });

  factory EditContacts.fromJson(Map<String, dynamic> json) {
    return new EditContacts(
      contactId: json['ContactId'],
      fundraiserId: json['FundraiserId'],
      contactFirstName: json['FirstName'],
      contactLastName: json['LastName'],
      contactRelationship: json['Relationship'],
      contactPhone: json['PrimaryPhone'],
      contactEmail: json['Email'],
      contactType: json['Type'],
      contactPhoto: json['Photo'],
      contactImage: json['Image'],
    );
  }
}
