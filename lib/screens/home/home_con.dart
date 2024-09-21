import 'package:get/get.dart';

class HomeCon extends GetxController
{
  RxInt pageIndex=0.obs;
  void setPageIndex(int newPageIndex){
    pageIndex.value=newPageIndex;
  }
}