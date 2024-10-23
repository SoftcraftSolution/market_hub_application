
import 'package:get/get.dart';

class FeedbackController extends GetxController
{
  RxInt rating=0.obs;
  RxString feedBackValue="Intuitive".obs;
  RxString otherFeedBack="Intuitive".obs;

  void setRating(int newValue)
  {
    if(newValue!=rating.value){
      rating.value=(newValue);
      // toast(msg: rating.value.toString());
    }
  }
  void setFeedBackValue(String newFeedBack)
  {
    if(newFeedBack!=feedBackValue.value){
      feedBackValue.value=newFeedBack;
    }
  }
  void setOthereFeedBack(String newFeedBack)
  {
    if(newFeedBack!=otherFeedBack.value){
      otherFeedBack.value=newFeedBack;
    }
  }
}