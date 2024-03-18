import 'package:demo/app/chitietsp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
class HomePageFruit extends StatelessWidget {
  HomePageFruit({super.key});
  final controller = Get.put(SanPhamController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chợ Online"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GetX<SanPhamController>(
        builder: (controller) {
          return GridView.extent(
              maxCrossAxisExtent: 300,
            children: controller.dssp.map((sp) => Card(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageChitiet(sp: sp,))),
                child: Column(
                  children: [
                    Expanded(
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(sp.url??"url mac dinh"),
                            )),
                    ),
                    Text(sp.ten),
                    Text("${sp.gia}VNĐ",style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
            )).toList(),
          );
        },
      ),
    );
  }
}
