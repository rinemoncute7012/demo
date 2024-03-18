import 'dart:ffi';

import 'package:get/get.dart';

import 'model.dart';

class SanPhamController extends GetxController{
  final _dssp = <Fruit>[].obs;
  final _giohang = <GH_Item>[].obs;
  List<Fruit> get dssp => _dssp.value;
  List<GH_Item> get giohang => _giohang.value;
  int get slmh => giohang.length;
  @override
  void onInit() {
    _dssp.value = AppData().dssp;
  }
  void addcart(Fruit fruit){
      giohang.add(GH_Item(fruit: fruit, sl: 1));
      _giohang.refresh();
  }
}