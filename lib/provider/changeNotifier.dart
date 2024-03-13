import 'package:flutter/foundation.dart';
class CounterChangeNotifier extends ChangeNotifier{
  int counter = 0;//trạng thái cần quản lý
  void tang(){
    counter++;
    notifyListeners();
  }
  void giam(){
    counter--;
    notifyListeners();
  }
}