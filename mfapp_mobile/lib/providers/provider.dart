import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../bin/api_addresses.dart';
import '../providers/fundraiser.dart';
import '../providers/fundraiser_details.dart';
import '../providers/user_details.dart';
import '../providers/user_stats.dart';
import '../providers/locations.dart';
import '../providers/new_fundraiser.dart';

class Fundraisers with ChangeNotifier {
  String authToken;
  UserDetails _userD;
  List<Locations> _locationList = [];

  Fundraisers(this.authToken, this._locationList, this._userD);

  List<Locations> get locationList {
    return [..._locationList];
  }

  UserDetails get userD {
    return _userD;
  }

  Future<FundraiserDetails> findById(int id) async {
    final url = Uri.parse(
        ApiProvider.baseUrl + ApiProvider.fundDetails + id.toString());
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return FundraiserDetails.fromJson(json.decode(response.body));
  }

  Future<List<Fundraiser>> fetchAndSetFundraisers() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.getFeatured);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    return extractedFundraisers
        .map((item) => Fundraiser.fromJson(item))
        .toList();
  }

  Future<List<Fundraiser>> searchUsers(String searchTerm) async {
    final url =
        Uri.parse(ApiProvider.baseUrl + ApiProvider.searchFund + searchTerm);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedFundraisers = json.decode(response.body);
    return extractedFundraisers
        .map((item) => Fundraiser.fromJson(item))
        .toList();
  }

  Future<UserDetails> getUserDetails() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.userDetails);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return UserDetails.fromJson(json.decode(response.body));
  }

  Future<UserStats> getUserData() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.userData + '30');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    return UserStats.fromJson(json.decode(response.body));
  }

  Future<List<Locations>> fetchLocations() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.locations);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final List extractedLocations = json.decode(response.body);
    return extractedLocations.map((item) => Locations.fromJson(item)).toList();
  }

  Future<void> getUserId() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.userDetails);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    final extractedData = json.decode(response.body);
    UserDetails userInfo = UserDetails.fromJson(extractedData);
    _userD = userInfo;
    notifyListeners();
  }

  Future<void> getLocations() async {
    _locationList = [];
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.locations);
    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ' + authToken});
      if (response.statusCode != 200) {
        _locationList = [];
      } else {
        Iterable l = json.decode(response.body);
        if (l.length > 0) {
          List<Locations> extractedGalleries =
              List<Locations>.from(l.map((model) => Locations.fromJson(model)));
          _locationList = extractedGalleries;
        }
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<List<dynamic>> fetchLineChartData() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.getStats);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    var extractedData = json.decode(response.body)['MonthlyDonationsAmount'];
    List<dynamic> monthlyDonations =
        extractedData != null ? List.from(extractedData) : null;
    return monthlyDonations;
  }

  Future<List<dynamic>> fetchBarChartData() async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.getStats);
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    var extractedData = json.decode(response.body)['DailyDonationsCount'];
    List<dynamic> dailyDonations =
        extractedData != null ? List.from(extractedData) : null;
    return dailyDonations;
  }

  Future<bool> payoutAndCloseFundraiser(int id) async {
    final url = Uri.parse(
        ApiProvider.baseUrl + ApiProvider.payoutAndCloseFund + id.toString());
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ' + authToken});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void editFundraiser(FundraiserDetails data) {
    var contacts = List<Map<String, dynamic>>.from(
      data.contactList.map(
        (e) => EditContacts().toJson(e),
      ),
    );
    var bankAccounts = List<Map<String, dynamic>>.from(
      data.location.bankAccounts.map(
        (e) => BankAccounts().toJson(e),
      ),
    );
    var request = {
      'FundraiserId': data.id,
      'ClientFirstName': data.firstName,
      'ClientMiddleName': data.middleName,
      'ClientLastName': data.lastName,
      'ClientNickName': data.nickName,
      'BirthDate': data.birthDate,
      'PassingDate': data.passingDate,
      'ClientAvatar':
          data.image != null && data.image64 != null ? null : data.clientAvatar,
      'ClientAvatarMD': data.image != null && data.image64 != null
          ? null
          : data.clientAvatarMD,
      'ClientAvatarSM': data.image != null && data.image64 != null
          ? null
          : data.clientAvatarSM,
      'FundContent': data.fundContent,
      'Website': data.website,
      'GoalAmount': data.goalAmount,
      'Closed': data.closed,
      'Draft': data.draft,
      'Featured': data.featured,
      'MFVisibility': data.featured,
      'AuthorizeContactFamily': data.authorizeContactFamily,
      'Template': data.template,
      'TemplateOptions': json.encode({
        if (data.textSelection != null) 'textSelection': data.textSelection,
        if (data.author != null) 'author': data.author,
        if (data.authorname != null) 'authorName': data.authorname,
        if (data.eventTime != null) 'eventTime': data.eventTime,
        if (data.eventDate != null) 'eventDate': data.eventDate,
        if (data.gender != null) 'gender': data.gender
      }),
      'DateCreated': data.dateCreated,
      'ExpirationDate': data.expirationDate,
      'UserId': data.userId,
      'LocationId': data.locationId,
      'CreationUserId': data.creationUserId,
      'LiveWebcast': data.liveWebcast,
      'FuneralService': json.encode({
        if (data.venueName != null) 'Venue': data.venueName,
        if (data.venuePhoneNumber != null)
          'VenuePhoneNumber': data.venuePhoneNumber,
        if (data.venueAddress != null) 'Address': data.venueAddress,
        if (data.venueCity != null) 'City': data.venueCity,
        if (data.venueState != null) 'State': data.venueState,
        if (data.venueZipCode != null) 'ZipCode': data.venueZipCode,
        if (data.venueDate != null) 'Date': data.venueDate,
        if (data.venueTime != null) 'Time': data.venueTime,
        if (data.venueAdditionalInfo != null)
          'AdditionalInfo': data.venueAdditionalInfo,
      }),
      'ShowFuneralHomeDetails': true,
      'GalleryImages': data.galleryImages,
      'Location': {
        'LocationId': data.location.locationId,
        'StripeAccountId': data.location.stripeAccountId,
        'UserId': data.location.userId,
        'Name': data.location.locationName,
        'Email': data.location.locationEmail,
        'PhoneNumber': data.location.locationPhone,
        'Address1': data.location.locationAddress1,
        'Address2': data.location.locationAddress2,
        'City': data.location.locationCity,
        'State': data.location.locationState,
        'PostalCode': data.location.locationPostalCode,
        'Country': data.location.country,
        'TaxId': data.location.taxId,
        'Website': data.location.website,
        'Logo': data.location.locationLogo,
        'StripeRequirements': data.location.stripeRequirements,
        'ChargesEnabled': data.location.chargesEnabled,
        'PayoutsEnabled': data.location.payoutsEnabled,
        'DateCreated': data.location.dateCreated,
        'HLAccountId': data.location.hLAccountId,
        'HLAccountApi': data.location.hLAccountApi,
        'HLSuccessCampaignId': data.location.hLSuccessCampaignId,
        'HLFailedCampaignId': data.location.hLFailedCampaignId,
        'HLFailedReminderCampaignId': data.location.hLFailedReminderCampaignId,
        'HLFundFormComplCampaignId': data.location.hLFundFormComplCampaignId,
        'Image': data.location.image,
        'Representatives': data.location.representatives,
        'BankAccounts': bankAccounts,
      },
      'Contacts': contacts,
      'Image': data.image != null && data.image64 != null
          ? {'Name': data.image, 'ImageData': data.image64}
          : null,
      'FundRaised': data.fundRaised,
      'GratuityFees': data.gratuityFees,
      'Payments': data.payment,
    };
    var requestD = json.encode(request);
    final url =
        Uri.parse(ApiProvider.baseUrl + ApiProvider.editExistingFundraiser);
    http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + authToken
        },
        body: requestD);
  }

  Future<void> addNewFundraiser(NewFundraiser data) async {
    var request = {
      'Contacts': data.contacts,
      'ClientFirstName': data.firstName,
      'Template': data.template,
      'ClientMiddleName': data.middleName,
      'ClientLastName': data.lastName,
      'ClientNickName': data.nickName,
      'BirthDate': data.birthDate,
      'PassingDate': data.passingDate,
      'GoalAmount': data.goalAmount,
      'Draft': data.draft,
      'FundContent': data.obituary,
      'MFVisibility': data.mfvisibility,
      'ExpirationDate': data.expirationDate,
      'LocationId': data.fundLocation.id,
      'ShowFuneralHomeDetails': true,
      'LiveWebcast': data.funeralService.venueWebCast != null
          ? data.funeralService.venueWebCast
          : null,
      'Image': {'Name': data.clientAvatar, 'ImageData': data.clientAvatar64},
      'TemplateOptions': json.encode({
        if (data.textSelection != null) 'textSelection': data.textSelection,
        if (data.author != null) 'author': data.author,
        if (data.authorName != null) 'authorName': data.authorName,
        if (data.eventTime != null) 'eventTime': data.eventTime,
        if (data.eventDate != null) 'eventDate': data.eventDate,
        if (data.gender != null) 'gender': data.gender
      }),
      'FuneralService': json.encode({
        if (data.funeralService.venueName != null)
          'Venue': data.funeralService.venueName,
        if (data.funeralService.venuePhoneNumber != null)
          'VenuePhoneNumber': data.funeralService.venuePhoneNumber,
        if (data.funeralService.venueAddress != null)
          'Address': data.funeralService.venueAddress,
        if (data.funeralService.venueCity != null)
          'City': data.funeralService.venueCity,
        if (data.funeralService.venueState != null)
          'State': data.funeralService.venueState,
        if (data.funeralService.venueZipCode != null)
          'ZipCode': data.funeralService.venueZipCode,
        if (data.funeralService.venueDate != null)
          'Date': data.funeralService.venueDate,
        if (data.funeralService.venueTime != null)
          'Time': data.funeralService.venueTime,
        if (data.funeralService.venueAdditionalInfo != null)
          'AdditionalInfo': data.funeralService.venueAdditionalInfo,
      }),
    };
    var requestD = json.encode(request);
    final url =
        Uri.parse(ApiProvider.baseUrl + ApiProvider.createNewFundraiser);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + authToken
        },
        body: requestD);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
