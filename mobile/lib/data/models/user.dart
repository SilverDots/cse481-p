import 'package:flutter/foundation.dart';

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.discordID,
    this.whatsAppID,
    this.appPreferences = const {}
  });

  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? discordID;
  final String? whatsAppID;
  final Map<String, dynamic> appPreferences;

  User copyWith({
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phoneNumber,
    final String? discordID,
    final String? whatsAppID,
    final Map<String, dynamic>? appPreferences
  }) {

    Map<String, dynamic> newAppPreferences = Map.from(this.appPreferences);
    if (appPreferences != null) {
      newAppPreferences.addAll(appPreferences);
    }
    
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      discordID: discordID ?? this.discordID,
      whatsAppID: whatsAppID ?? this.whatsAppID,
      appPreferences: newAppPreferences
    );
  }

  @override
  int get hashCode {
    int val = super.hashCode;
    val = 31 * val + firstName.hashCode;
    val = 31 * val + lastName.hashCode;
    val = 31 * val + email.hashCode;
    if (phoneNumber != null) {
      val = 31 * val + phoneNumber.hashCode;
    }
    if (discordID != null) {
      val = 31 * val + discordID.hashCode;
    }
    if (whatsAppID != null) {
      val = 31 * val + whatsAppID.hashCode;
    }
    return val;
  }

  @override
  bool operator ==(Object other) {
    if (other is User
        && firstName == other.firstName
        && lastName == other.lastName
        && email == other.email
        && phoneNumber == other.phoneNumber
        && discordID == other.discordID
        && whatsAppID == other.whatsAppID
        && mapEquals(appPreferences, other.appPreferences)) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> res = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email
    };
    if (phoneNumber != null) {
      res['phone'] = phoneNumber;
    }
    if (discordID != null) {
      res['discordID'] = discordID;
    }
    if (whatsAppID != null) {
      res['whatsAppID'] = whatsAppID;
    }
    // res['preferences'] = appPreferences;
    return res;
  }
}