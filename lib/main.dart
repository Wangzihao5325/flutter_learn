import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/router/rootRouterManager.dart';
import 'package:myapp/components/pageWrapper/pageWrapper.dart';
import 'package:myapp/components/tabbar/tabbar.dart';

void main() async {
  //init
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter learning',
      home: new RootWgt(),
    );
  }
}

class RootWgt extends StatefulWidget {
  @override
  createState() => new RootWgtState();
}

class RootWgtState extends State<RootWgt> {
  RootRouterManager manager = RootRouterManager();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: ChangeNotifierProvider(
        create: (context) => manager.tabBarManager,
        child: TabBarWgt(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => manager.pagesManager,
        child: PageWrapper(),
      ),
    );
  }
}
