import 'package:market_hub_application/core/utils/utils.dart';

class PlanCardActionController{
  int amount;
  String planName;
  PlanCardActionController({required this.amount,required this.planName});

  Future<void> onTryNow()async{
    Print.p("on TryNow");
    customToast(msg: planName);
  }
  Future<void> onBuyNow()async{
    Print.p("on BuyNow");
    customToast(msg: planName);
  }
}