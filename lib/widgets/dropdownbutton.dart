import 'package:demo/widgets/wrapper_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  StringWrapper value;
  List<String> lables;
  Widget Function(String lable)? buildItem;
  MyDropDownButton({required this.value,required this.lables,this.buildItem,super.key}); //const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: widget.value.value,
        items: widget.lables.map((lable) => DropdownMenuItem(
            child: widget.buildItem == null? Text(lable) : widget.buildItem!(lable) ,
                value: lable,
        )).toList(),
        onChanged: (value){
          setState(() {
            widget.value.value = value;
          });
    }
    );
  }
}
