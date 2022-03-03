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
  String clientAvatarMD;
  String clientAvatarSM;
  String fundContent;
  String website;
  double goalAmount;
  bool closed;
  bool draft;
  bool featured;
  bool mfVisibility;
  bool authorizeContactFamily;
  bool template;
  String dateCreated;
  int userId;
  int locationId;
  int creationUserId;
  String liveWebcast;
  String templateOptions;
  String funeralService;
  bool showFuneralHomeDetails;
  List galleryImages;
  String image;
  String image64;
  double gratuityFees;
  double fundRaised;
  Location location;
  List<Payment> payment;
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
    this.image64,
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
    this.website,
    this.closed,
    this.featured,
    this.mfVisibility,
    this.authorizeContactFamily,
    this.dateCreated,
    this.userId,
    this.locationId,
    this.creationUserId,
    this.showFuneralHomeDetails,
    this.galleryImages,
    this.image,
    this.gratuityFees,
  });

  factory FundraiserDetails.fromJson(Map<String, dynamic> json) {
    List listOfContacts = json['Contacts'];
    List<EditContacts> userContacts;
    List<Payment> paymentList;
    if (listOfContacts != null) {
      userContacts =
          listOfContacts.map((i) => EditContacts.fromJson(i)).toList();
    }
    List list = json['Payments'];
    if (list != null) {
      paymentList = list.map((i) => Payment.fromJson(i)).toList();
    }
    var userOptions = json['TemplateOptions'];
    var options;
    if (userOptions != null) {
      options = jsonDecode(json['TemplateOptions']);
    }
    var userService = json['FuneralService'];
    var service = {};
    if (userService != null) {
      service = jsonDecode(json['FuneralService']);
    }
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
      website: json['Website'],
      closed: json['Closed'],
      featured: json['Featured'],
      mfVisibility: json['MFVisibility'],
      authorizeContactFamily: json['AuthorizeContactFamily'],
      dateCreated: json['DateCreated'],
      userId: json['UserId'],
      locationId: json['LocationId'],
      creationUserId: json['CreationUserId'],
      showFuneralHomeDetails: json['ShowFuneralHomeDetails'],
      galleryImages: json['GalleryImages'],
      gratuityFees: json['GratuityFees'],
      contactList: userContacts,
    );
  }
}

class Location {
  final int locationId;
  String stripeAccountId;
  int userId;
  final String locationName;
  final String locationEmail;
  final String locationPhone;
  final String locationAddress1;
  final String locationAddress2;
  final String locationCity;
  final String locationPostalCode;
  int country;
  String taxId;
  String website;
  final int locationState;
  final String locationLogo;
  String stripeRequirements;
  bool chargesEnabled;
  bool payoutsEnabled;
  String dateCreated;
  String hLAccountId;
  String hLAccountApi;
  String hLSuccessCampaignId;
  String hLFailedCampaignId;
  String hLFailedReminderCampaignId;
  String hLFundFormComplCampaignId;
  String image;
  List representatives;
  List<BankAccounts> bankAccounts;

  Location({
    this.locationId,
    this.stripeAccountId,
    this.userId,
    this.locationName,
    this.locationEmail,
    this.locationPhone,
    this.locationAddress1,
    this.locationAddress2,
    this.locationCity,
    this.locationPostalCode,
    this.country,
    this.taxId,
    this.website,
    this.locationState,
    this.locationLogo,
    this.stripeRequirements,
    this.chargesEnabled,
    this.payoutsEnabled,
    this.dateCreated,
    this.hLAccountId,
    this.hLAccountApi,
    this.hLSuccessCampaignId,
    this.hLFailedCampaignId,
    this.hLFailedReminderCampaignId,
    this.hLFundFormComplCampaignId,
    this.image,
    this.representatives,
    this.bankAccounts,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    List listOfAccounts = json['BankAccounts'];
    List<BankAccounts> accounts;
    if (listOfAccounts != null) {
      accounts = listOfAccounts.map((i) => BankAccounts.fromJson(i)).toList();
    }
    return new Location(
      locationId: json['LocationId'],
      stripeAccountId: json['StripeAccountId'],
      userId: json['UserId'],
      locationName: json['Name'],
      locationEmail: json['Email'],
      locationPhone: json['PhoneNumber'],
      locationAddress1: json['Address1'],
      locationAddress2: json['Address2'],
      locationCity: json['City'],
      locationPostalCode: json['PostalCode'],
      country: json['Country'],
      taxId: json['TaxId'],
      website: json['Website'],
      locationState: json['State'],
      locationLogo: json['Logo'],
      stripeRequirements: json['StripeRequirements'],
      chargesEnabled: json['ChargesEnabled'],
      payoutsEnabled: json['PayoutsEnabled'],
      dateCreated: json['DateCreated'],
      hLAccountId: json['HLAccountId'],
      hLAccountApi: json['HLAccountApi'],
      hLSuccessCampaignId: json['HLSuccessCampaignId'],
      hLFailedCampaignId: json['HLFailedCampaignId'],
      hLFailedReminderCampaignId: json['HLFailedReminderCampaignId'],
      hLFundFormComplCampaignId: json['HLFundFormComplCampaignId'],
      image: json['Image'],
      representatives: json['Representatives'],
      bankAccounts: accounts,
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
  String contactImage64;

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

  Map<String, dynamic> toJson(EditContacts data) {
    return {
      'ContactId': data.contactId,
      'FundraiserId': data.fundraiserId,
      'Image': data.contactImage != null && data.contactImage64 != null
          ? {'Name': data.contactImage, 'ImageData': data.contactImage64}
          : null,
      'FirstName': data.contactFirstName,
      'LastName': data.contactLastName,
      'Relationship': data.contactRelationship,
      'PrimaryPhone': data.contactPhone,
      'Email': data.contactEmail,
      'Type': data.contactType,
      'Photo': data.contactImage != null && data.contactImage64 != null
          ? null
          : data.contactPhoto
    };
  }
}

class BankAccounts {
  int bankAccountId;
  String stripeExtAccountId;
  int locationId;
  String holderName;
  String bankName;
  int country;
  String accountNumber;
  String routingNumber;
  String currency;
  bool isDefault;

  BankAccounts({
    this.bankAccountId,
    this.stripeExtAccountId,
    this.locationId,
    this.holderName,
    this.bankName,
    this.country,
    this.accountNumber,
    this.routingNumber,
    this.currency,
    this.isDefault,
  });

  factory BankAccounts.fromJson(Map<String, dynamic> json) {
    return new BankAccounts(
      bankAccountId: json['BankAccountId'],
      stripeExtAccountId: json['StripeExtAccountId'],
      locationId: json['LocationId'],
      holderName: json['HolderName'],
      bankName: json['BankName'],
      country: json['Country'],
      accountNumber: json['AccountNumber'],
      routingNumber: json['RoutingNumber'],
      currency: json['Currency'],
      isDefault: json['IsDefault'],
    );
  }
}
