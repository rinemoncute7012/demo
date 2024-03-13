class SinhVien{
  String id, ten;
  String? ngaySinh,que_Quan;

  SinhVien({required this.id,required this.ten, this.ngaySinh, this.que_Quan});

  @override
  String toString() {
    return 'SinhVien id: $id, ten: $ten, ngaySinh: $ngaySinh, que_Quan: $que_Quan';
  }
}

class QL_SinhVien{
  List<SinhVien> list =[];

  void add({SinhVien? sinhVien}){
    if(sinhVien != null) {
      list.add(sinhVien);
    }
  }
  void inds(){
    list.forEach((sv) {
      print(sv.toString());
    });
  }
  void inds2(){
    for(SinhVien s in list){
      print(s.toString());
    }

  }
}

void main(){
  print("63.HTTT");
  SinhVien sinhVien = SinhVien(id:"01", ten:"Quoc Anh",ngaySinh: "10/01/2003",que_Quan: "Nha Trang");
  print(sinhVien.toString());
  QL_SinhVien ql_sinhVien = QL_SinhVien();
  ql_sinhVien.add(sinhVien: SinhVien(id: "01", ten: "Quoc Anh",que_Quan: "Khanh Hoa",ngaySinh: "09/01/2003"));
  ql_sinhVien.add(sinhVien: SinhVien(id: "02", ten: "Quoc Anh1",que_Quan: "Khanh Hoa",ngaySinh: "09/01/2003"));
  ql_sinhVien.add(sinhVien: SinhVien(id: "03", ten: "Quoc Anh2",que_Quan: "Khanh Hoa",ngaySinh: "09/01/2003"));
  ql_sinhVien.add(sinhVien: SinhVien(id: "04", ten: "Quoc Anh3",que_Quan: "Khanh Hoa",ngaySinh: "09/01/2003"));
  ql_sinhVien.inds();
}