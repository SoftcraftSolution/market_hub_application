import 'dart:io';

class UserDetail {
  String name;
  String whatsappNumber;
  String phoneNumber;
  String email;
  String pincode;
  File visitingCard;
  String? pin;
  String? plan;
  UserDetail(
      {required this.phoneNumber,
      required this.pincode,
      required this.visitingCard,
      required this.email,
      required this.name,
      required this.whatsappNumber});
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
      'visitingCard': visitingCard.path, // Store the file path
      'pin': pin,
      'plan': plan,
    }.toString();
  }


}
