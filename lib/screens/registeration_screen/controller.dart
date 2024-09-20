import 'package:get/get.dart';

class RegistrationCon extends GetxController{
  RxBool isUploaded=false.obs;
  RxString finalName="".obs;
  void setUploadState(var newValue){
    if(newValue!=isUploaded.value){
      isUploaded.value=newValue;
    }
  }
  void setFileName(String finalName)
  {
    this.finalName.value=finalName;
  }

}