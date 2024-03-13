import 'package:demo/form/page_form_profile.dart';
import 'package:demo/widgets/page_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter khong Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: PageHome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
          child: Column(
            children: [
              Text("Tet den roi", style: TextStyle(fontSize: 30, color: Colors.red),),
              Text("Ve que thoi", style: TextStyle(fontSize: 20),)
            ],
          )
      ),
    );
  }
}
