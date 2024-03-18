import 'dart:ffi';

class Fruit{
  String ten;
  String? url;
  double gia;
  String? moTa;
  Fruit({required this.ten, this.url, required this.gia,this.moTa});
}
class GH_Item{
  Fruit fruit;
  int sl;

  GH_Item({required this.fruit,required this.sl});
}

Map<String, String> images = {
  "xoai" : "https://file.hstatic.net/1000302988/article/xo_i-c_t-c_n-gi__975d9a5887a44de184cdf7f697b4ca3b_1024x1024.png",
  "dao" : "https://media1.nguoiduatin.vn/media/hoang-thi-bich/2022/07/02/dao-tien.jpg",
  "buoi" : "https://vtv1.mediacdn.vn/zoom/640_400/2018/9/30/qua-buoi-crop-15382740582511307278703.jpg",
  "le" : "https://lh3.googleusercontent.com/8yZ4Dy87F7YpolmJGNkgCO7LxyFdX3R8euBBX9lPHVuiXEgiKR9Rf5beRp9yInZnyzNXaNjtyN_uYCl60x75ZPNo3QJNJAS3=rw",
  "man" : "https://ttol.vietnamnetjsc.vn/images/2020/07/10/14/30/man-trung-quoc-1.jpg",
  "vai" : "https://cafefcdn.com/203337114487263232/2021/6/11/photo-1-16233745066041882362329.jpg",
  "cam" : "https://dt-pro.vn/upload/product/cam-my.jpg",
  "tlong" : "https://bizweb.dktcdn.net/thumb/grande/100/390/808/products/thanh-long-600x600.jpg?v=1600505776873",
  "chanh" : "https://bizweb.dktcdn.net/thumb/grande/100/430/652/products/chanh-vang-3.jpg?v=1626247693937",
  "me" : "https://suckhoedoisong.qltns.mediacdn.vn/Images/haiyen/2017/03/20/nhung-loi-ich-bat-ngo-tu-trai-me1489997444.jpg",
};
class AppData{
  final List<Fruit> _dssp=[
    Fruit(ten: "Đào", url: images["dao"], gia: 23400,moTa: "ĐÀO THẦN TIÊN, ĂN VÀO LÀ THÀNH TIÊN"),
    Fruit(ten: "Mận", url: images["man"], gia: 33000,moTa: "MẬN MÀ SIUUUUUU NGON"),
    Fruit(ten: "Lê", url: images["le"], gia: 31500,moTa:"LÊ ĐƯỜNG SIUUUUU NGỌT"),
    Fruit(ten: "Bưởi", url: images["buoi"], gia: 42000,moTa:"BUOI TO,NGOT"),
    Fruit(ten: "Xoài", url: images["xoai"], gia: 56000,moTa:"XOÀI CHUA LOẠI REP 1-1"),
    Fruit(ten: "Vải", url: images["vai"], gia: 20000,moTa:"VÃI NGON"),
    Fruit(ten: "Cam", url: images["cam"], gia: 22000,moTa:"CAM SIU NGON"),
    Fruit(ten: "Thanh long", url: images["tlong"], gia: 27500,moTa: "THANH LONG NAY NGON"),
    Fruit(ten: "Chanh", url: images["chanh"], gia: 15500,moTa:"CHANH CHUA LAM"),
    Fruit(ten: "Me", url: images["me"], gia: 26200,moTa: "ME BAO CHUA LOẠI GIA"),
  ];
  List<Fruit> get dssp => _dssp;

}
