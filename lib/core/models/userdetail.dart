import 'dart:io';

import 'package:hive/hive.dart';
part 'userdetail.g.dart';
@HiveType(typeId: 1,adapterName: "UserDetailAdapter")
class UserDetail {
  @HiveField(0)
  String name;
  @HiveField(1)
  String whatsappNumber;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  String email;
  @HiveField(4)
  String pincode;
  @HiveField(5)
  String visitingCard;
  @HiveField(6)
  String? pin;
  @HiveField(7)
  String? plan;
  @HiveField(8)
  String? city;
  @HiveField(9)
  String? state;
  @HiveField(10)
  String? country;
  @HiveField(11)
  bool? isApproved;
  @HiveField(12)
  int? extendendDays;
  @HiveField(13)
  bool? isRejected;
  @HiveField(14)
  bool? isInTrail;
  @HiveField(15)
  bool? isFreeUser;
  @HiveField(16)
  String? planStartDate;
  @HiveField(17)
  String? planEndDate;

  UserDetail({
    required this.phoneNumber,
    required this.pincode,
    required this.visitingCard,
    required this.email,
    required this.name,
    required this.whatsappNumber,
    this.pin,
    this.plan,
    this.city,
    this.state,
    this.country,
    this.isApproved,
    this.extendendDays,
    this.isRejected,
    this.isInTrail,
    this.isFreeUser,
    this.planEndDate,
    this.planStartDate
  });
  void setPin({required String pin}){
    this.pin=pin;
  }
  void setPlan({required String plan}){
    this.plan=plan;
  }
  String toString() {
    return {
      'name': name,
      'whatsappNumber': whatsappNumber,
      'phoneNumber': phoneNumber,
      'email': email,
      'pincode': pincode,
      'visitingCard': visitingCard, // Store the file path
      'pin': pin,
      'plan': plan,
    }.toString();
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'whatsappNumber': whatsappNumber,
      'phoneNumber': phoneNumber,
      'email': email,
      'pincode': pincode,
      'visitingCard': visitingCard,
      'pin': pin,
      'plan': plan,
      'city': city,
      'state': state,
      'country': country,
      'isApproved': isApproved,
      'extendendDays': extendendDays,
      'isRejected': isRejected,
      'isInTrail': isInTrail,
      'isFreeUser': isFreeUser,
      'planStartDate': planStartDate,
      'planEndDate': planEndDate,
    };
  }
  static UserDetail fromMap(Map<String, dynamic> data) {
    return UserDetail(
        name: data['fullName'],
        email: data['email'],
        whatsappNumber: data['whatsappNumber'],
        phoneNumber: data['phoneNumber'],
        pincode: data['pincode'],
        visitingCard: data['visitingCard']??"",
        pin: data['pin']?.toString(), // Optional, converted to String if present
        plan: data['planName'],        // Optional field for plan
        city: data['city'],            // Optional field for city
        state: data['state'],          // Optional field for state
        country: data['country'],      // Optional field for country
        isApproved: data['isApproved'], // Optional field for isApproved
        extendendDays: data['extendendDays'], // Optional field for extendendDays
        isRejected: data['isRejected'], // Optional field for isRejected
        isInTrail: data['isInTrail'],  // Optional field for isInTrail
        isFreeUser: data['isFreeUser'],
        planEndDate:data["planEndDate"],
        planStartDate: data["planStartDate"]
      // Optional field for isFreeUser
    );
  }


}