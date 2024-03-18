import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'model.dart';
class PageChitiet extends StatelessWidget {
  final Fruit sp;
  const PageChitiet({super.key, required this.sp});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width*0.9;
    var rating = Random().nextInt(41)/10.0+1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Chi tiết sản phẩm"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
          )
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: w,
                child: Image.network(sp.url??"Anh mac dinh"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sp.ten,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                Text("${sp.moTa}",style :TextStyle(fontSize: 20)),
                Text("${sp.gia}VNĐ",style: TextStyle(color: Colors.red,fontSize: 25)),
                Row(
                  children: [
                    RatingBar.builder(initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate:  (rating) {
                          print(rating);
                        },),
                    SizedBox(width: 5,),
                    Text("${rating}",style: TextStyle(color: Colors.red,fontSize: 24),)
                  ],
                ),

              ],
            )
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = Get.find<SanPhamController>();
          controller.addcart(sp);
        },
      child: Icon(Icons.add_shopping_cart,color: Colors.red,),),
    );
  }
}
