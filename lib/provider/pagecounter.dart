import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'changeNotifier.dart';
class PageProvider extends StatelessWidget {
  const PageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => CounterChangeNotifier(),
      child: PageCounter(),
    );
  }
}
class PageCounter extends StatelessWidget {
  const PageCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ví dụ Provider"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var provider = context.read<CounterChangeNotifier>();
                    provider.tang();
                  },
                  child: Text("+")),
              Consumer<CounterChangeNotifier>
                (builder: (context, value, child) {
                  return Column(
                    children: [
                      Text("${value.counter}",style: TextStyle(fontSize: 20),),
                      child!
                    ],
                  );
                },
                child: Text("Không được build lại"),
              ),
              ElevatedButton(
                  onPressed: () {
                    var provider = context.read<CounterChangeNotifier>();
                    provider.giam();
                  },
                  child: Text("-"))
            ],
          ),
        ),
      ),
    );
  }
}
