import 'dart:math';
Future<int> lateNum(){
  var num = Future.delayed(
    Duration(seconds: 2),
      () => Random().nextInt(1000),
  );
  return num;
}
void main() async{
  // int num = await lateNum();
  // print(num);
  lateNum().then(
    //value: giá trị trả về của hàm
          (value) => print(value));
  print("hello");
}