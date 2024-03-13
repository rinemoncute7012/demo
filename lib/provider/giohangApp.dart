import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:badges/badges.dart' as badges;

class AppGioHangNTU extends StatelessWidget {
  const AppGioHangNTU({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create: (context) => AppGioHangState(),
      child: MaterialApp(
        home: FruitStoreHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class FruitStoreHomePage extends StatelessWidget {
  const FruitStoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppGioHangState gioHangStateNTU = context.watch<AppGioHangState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GioHangPage(),)
                );
              },
              child: badges.Badge(
                showBadge: gioHangStateNTU.slMatHangTrongGH>0,
                badgeContent: Text("${gioHangStateNTU.slMatHangTrongGH}",
                  style: TextStyle(color: Colors.white),),
                child: Icon(Icons.shopping_cart_outlined, size: 35,),

              ),
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(gioHangStateNTU.dssp[index]),
            trailing: IconButton(
              onPressed: () {
                var gioHang = context.read<AppGioHangState>();
                gioHang.them(index);
              },
              icon: gioHangStateNTU.ktMatHangTrongGH(index) == false?
              Icon(Icons.add):Icon(Icons.check),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1.5,),
        itemCount: gioHangStateNTU.dssp.length,
      ),
    );
  }
}
class GioHangPage extends StatelessWidget {
  const GioHangPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppGioHangState gioHangStateNTU = context.watch<AppGioHangState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  int idMH =gioHangStateNTU.gioHang[index];
                  return ListTile(
                    title: Text("${gioHangStateNTU.dssp[idMH]}"),
                    trailing: IconButton(
                      onPressed: () {
                        var gioHang = context.read<AppGioHangState>();
                        gioHang.xoa(index);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: gioHangStateNTU.slMatHangTrongGH),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tổng số tiền:\t\t"),
                Text("${49999*gioHangStateNTU.slMatHangTrongGH}\tVNĐ")
              ],
            ),
          )
        ],
      ),
    );
  }
}