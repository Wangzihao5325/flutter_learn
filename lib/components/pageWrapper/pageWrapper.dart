import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/router/rootRouterManager.dart';

class PageWrapper extends StatefulWidget {
  @override
  PageWrapperState createState() => PageWrapperState();
}

class PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PagesManager>(builder: (context, manager, child) {
      return manager.pages[manager.selectedPage];
    });
  }
}
