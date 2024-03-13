import 'package:demo/form/form_model.dart';
import 'package:flutter/material.dart';

class Page_form extends StatelessWidget {
  final GlobalKey<FormState> formState = GlobalKey<FormState>(); // Di chuyển khởi tạo vào đây

  Page_form({Key? key}) : super(key: key);

  SinhVien s = SinhVien();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDiem = TextEditingController();
  String? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                controller: txtName,
                onSaved: (newValue) => s.name = newValue,
                validator: (value) => validateString(value),
                decoration: InputDecoration(
                    labelText: "Tên Sinh Viên"
                ),
              ),
              DropdownButtonFormField<String>(
                items: loaiSV.map(
                        (loaiSV) => DropdownMenuItem<String>(
                    child: Text("${loaiSV}"),
                    value: loaiSV,
                ))
                    .toList(),
                onChanged: (value) => dropdownvalue = value,
                onSaved: (newValue) => s.loaiSV = newValue,
                value: dropdownvalue,
                validator: (value) => validateString(value),
                decoration: InputDecoration(
                    labelText: "Loại sinh viên"
                ),
              ),
              TextFormField(
                controller: txtDiem,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => s.Diem = int.parse(newValue!),
                validator: (value) => validateDiem(value),
                decoration: InputDecoration(
                    labelText: "Điểm"
                ),
              ),
              Row(
                mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => save(context),
                      child: Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  save(BuildContext context) {
    if(formState.currentState!.validate()){
      formState.currentState!.save();
      hienthidialog(context);
    }
  }

  validateString(String? value) {
    return value == null || value.isEmpty? "Bạn chưa nhập dữ liệu" : null;
  }

  validateDiem(String? value) {
    if(value==null || value.isEmpty)
      return "Bạn chưa nhập điểm";
    else
      return int.parse(value)<0?"Điểm không được phép bé hơn 0" : null;
  }

  void hienthidialog(BuildContext context) {
    var dialog= AlertDialog(
      title: Text("Thông báo"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Bạn đã nhập sinh viên"),
          Text("Tên SV:${s.name}"),
          Text("Loại SV:${s.loaiSV}"),
          Text("Điểm SV:${s.Diem}"),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK")
        )
      ],
    );
    showDialog(context: context, builder:(context) => dialog);
  }
}
