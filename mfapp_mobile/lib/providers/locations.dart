import 'package:flutter/foundation.dart';

class Locations with ChangeNotifier {
  final int id;
  final String stripeAccountId;
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
  final String dateCreated;
  final String image;

  Locations({
    this.id,
    this.stripeAccountId,
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
    this.dateCreated,
    this.image,
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    return new Locations(
      id: json['LocationId'],
      stripeAccountId: json['StripeAccountId'],
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
      dateCreated: json['DateCreated'],
      image: json['Image'],
    );
  }
}
