import 'package:demo/widgets/dropdownbutton.dart';
import 'package:demo/widgets/radiobutton.dart';
import 'package:demo/widgets/wrapper_Data.dart';
import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? game = "Liên minh";
  StringWrapper gm = StringWrapper(value: "Liên minh");
  StringWrapper gt = StringWrapper(value: "Nam");
  List<String> games =["Liên minh","Valorant","Mario","Pokemon"];
  String? gioitinh= "Nữ";
  DateTime? ngaysinh = DateTime(2003,9,1);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Trang cá nhân của tôi"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("asset/Images/text.png"),
              ),
                accountName: Text("Rie"),
                accountEmail: Text("angna3d@gmail.com")
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Inbox"),
              trailing: Text("10"),
            ),

          ],
        ),
      ),
      body: _buildBody(context, index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.yellowAccent,),
              icon: Icon(Icons.home,color: Colors.grey,),
            label: "Home"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.phone,color: Colors.blue,),
              icon: Icon(Icons.phone,color: Colors.grey,),
              label: "Phone"
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
  _buildBody(BuildContext context,int index){
    switch (index){
      case 0: return _buildHome(context);
      case 1: return _build_SMS(context);
    }
  }

  _buildHome(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset("asset/Images/text.png"),
          ),
          const SizedBox(height: 10,),
          const Text('Họ và tên:',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          const Text('Lý Quốc Anh',
              style:
              TextStyle(
                fontSize: 26,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )
          ),
          const Text('Ngày sinh:',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          Row(
            children: [
              Expanded(
                child: Text('${ngaysinh!.day}/${ngaysinh!.month}/${ngaysinh!.year}',
                    style:
                    TextStyle(
                      fontSize: 22,
                    )
                ),
              ),
              IconButton(
                  onPressed: () async{
                    final now = DateTime.now();
                    final first = now.subtract(Duration(days: 365 * 50));
                    final last = now.add(Duration(days: 365 * 50));
                    var d = await showDatePicker(
                        context: context,
                        firstDate: first,
                        lastDate: last
                    );
                    if(d !=null)
                      setState(() {
                        ngaysinh = d;
                      });
                  },
                  icon: SizedBox(
                      width: 50,
                      child: Icon(Icons.calendar_month)))
            ],
          ),
          const Text('Giới tính:',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: ListTile(
          //         leading: Radio(value: "Nữ",
          //                       groupValue: gioitinh ,
          //                       onChanged: (value){
          //                       setState(() {
          //                         gioitinh = value as String;
          //                       });
          //           },
          //         ),
          //         title: const Text("Nữ",
          //           style: TextStyle(
          //           fontSize: 22,
          //         ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: ListTile(
          //         leading: Radio(value: "Nam",
          //           groupValue: gioitinh ,
          //           onChanged: (value){
          //             setState(() {
          //               gioitinh = value as String;
          //             });
          //           },
          //         ),
          //         title: const Text("Nam",
          //           style: TextStyle(
          //           fontSize: 22,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          MyRadioButton(groupValue: gt,labels: ["Nam","Nữ"]),
          const Text('Quê quán:',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          const Text('Nha Trang, Khánh Hòa',
              style:
              TextStyle(
                fontSize: 22,
              )
          ),
          const Text('Sở thích:',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          const Text('Nghe nhạc, xem phim, chơi game.',
              style:
              TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontStyle: FontStyle.italic,
              )
          ),
          const Text('Chọn game bạn muốn chơi',
              style:
              TextStyle(
                fontSize: 18,
              )
          ),
          // DropdownButton(
          //   isExpanded: true,
          //   value: game,
          //     items: games.map(
          //             (game) => DropdownMenuItem(
          //                 child: Text(game),
          //                 value: game)).toList(),
          //     onChanged: (value)
          //     {
          //       setState(() {
          //         game = value;
          //       });
          //     })
          MyDropDownButton(
            value: gm,
            lables: games,
            buildItem: (lable) => Row(
              children: [
                Icon(Icons.gamepad),
                SizedBox(width: 30,),
                Text(lable)
              ],
            ),
          )
        ],
      ),
    );
  }

  _build_SMS(BuildContext context) {
    return Center(
      child: Text("Gọi điện"),
    );
  }
}
