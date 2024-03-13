import 'package:flutter/material.dart';

class AppGioHangState extends ChangeNotifier{
  List<String> _dssp = ["Chom Chom", "Sau rieng", "Dau tay", "Buoi", "Cam", "Quyt",
    "Xoai", "Coc", "Man"];
  List<int> _gioHang = [];
  List<String> get dssp => _dssp;
  List<int> get gioHang => _gioHang;
  int get slMatHangTrongGH => gioHang.length;
  void them(int index){
    if(!ktMatHangTrongGH(index)) {
      gioHang.add(index);
      notifyListeners();
    }
  }
  void xoa(int index){
    gioHang.removeAt(index);
    notifyListeners();
  }
  bool ktMatHangTrongGH(int index){
    for(int i in gioHang)
      if(i == index)
        return true;
    return false;
  }
}