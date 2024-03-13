import 'package:demo/bt/baitap.dart';
import 'package:demo/form/page_form_profile.dart';
import 'package:demo/profile/page_profile.dart';
import 'package:demo/provider/giohangApp.dart';
import 'package:demo/provider/pagecounter.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng của tôi"),
        backgroundColor: Theme.of(context).
        colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton(context,lable: "My Profile",destination: MyProfile()),
              _buildButton(context,lable: "My Form",destination: Page_form()),
              _buildButton(context, lable: "Provider", destination: PageProvider()),
              _buildButton(context, lable: "Trai Cay", destination: PageList()),
              _buildButton(context, lable: "Trai Cay Store", destination: AppGioHangNTU()),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildButton(BuildContext context, {required String lable,required Widget destination}) {
    double w = MediaQuery.of(context).size.width*0.75;
    return Container(
      width: w,
              child: ElevatedButton(

                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) => destination,)
                    );
                  },
                  child: Text(lable)
              ),
            );
  }
}
