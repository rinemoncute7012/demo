import 'package:get/get.dart';
import 'package:flutter/material.dart';
class Controller extends GetxController {
  final _count = 0.obs;
  int get count => _count.value;
  void tang(){
    _count.value++;
    _count.refresh();//gọi khi thành phần được bao bọc là 1 đối tượng có kdl do ng dùng tự định nghĩa
  }
  void giam(){
    _count.value--;
    _count.refresh();
  }
}
class SimpleCounter extends GetxController{
  int counter = 0;
  static SimpleCounter get({String? tag}) => Get.find(tag: tag);
  void increment(){
    counter++;
    update(["01"], counter<=20);
  }
}
class PageGetCounter extends StatelessWidget {
  PageGetCounter({super.key});
  final c = Get.put(Controller());
  final c1 = Get.find<Controller>();
  final c2 = Get.put(Controller());
  final c3 = Get.put(Controller(),tag: "c3");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  c.tang();
                  c3.giam();
                }, 
                child: Icon(Icons.add)),
            GetX<Controller>(
                builder: (controller) => Text("${controller._count.value}"),
            ),
            Obx(() => Text("C:${c._count}")),
            Obx(() => Text("C1:${c1._count}")),
            Obx(() => Text("C2:${c2._count}")),
            GetX<Controller>(
                tag: "c3",
                builder:(controller) => Text("GetX C3: ${controller._count}"), ),
            ElevatedButton(
                onPressed: () {
                  c.giam();
                  c3.tang();
                },
                child: Icon(Icons.remove)),
            GetBuilder<SimpleCounter>(
              init: SimpleCounter(),
              id: "01",
              tag: "my_simple_state",
              builder: (controller) => Text("${controller.counter}"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          SimpleCounter.get(tag: "my_simple_state").increment();
        },
      ),
    );
  }
}

