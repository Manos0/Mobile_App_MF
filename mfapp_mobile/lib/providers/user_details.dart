class UserDetails {
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

  UserDetails({
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

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
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
