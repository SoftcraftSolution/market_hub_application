import 'package:get/get.dart';

class RegistrationCon extends GetxController{
  RxBool isUploaded=false.obs;

  void setUploadState(var newValue){
    if(newValue!=isUploaded.value){
      isUploaded.value=newValue;
    }
  }
}