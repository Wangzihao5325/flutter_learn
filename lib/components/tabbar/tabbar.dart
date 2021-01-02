import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/router/rootRouterManager.dart';

class TabBarWgt extends StatefulWidget {
  @override
  TabBarState createState() => TabBarState();
}

class TabBarState extends State<TabBarWgt> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TabBarManager>(builder: (context, manager, child) {
      print('index = ${manager.selectedIndex}');
      return _bottomNavigationBar(manager);
    });
  }

  BottomNavigationBar _bottomNavigationBar(TabBarManager manager) {
    return BottomNavigationBar(
      // items
      items: [
        _createItem(AssetImage('assets/images/tab/tab_find.png'),
            AssetImage('assets/images/tab/tab_find_green.png'), 'one'),
        _createItem(AssetImage('assets/images/tab/tab_chat.png'),
            AssetImage('assets/images/tab/tab_chat_green.png'), 'two'),
        _createItem(AssetImage('assets/images/tab/tab_mine.png'),
            AssetImage('assets/images/tab/tab_mine_green.png'), 'three'),
      ],
      currentIndex: manager.selectedIndex,

      onTap: (index) {
        manager.selectedIndex = index;
      },

      type: BottomNavigationBarType.fixed,

      unselectedItemColor: Color.fromRGBO(51, 51, 51, 1),
      selectedItemColor: Color.fromRGBO(0, 186, 85, 1),

      selectedFontSize: 15,
      unselectedFontSize: 15,

      showUnselectedLabels: true,
    );
  }

  BottomNavigationBarItem _createItem(
      AssetImage image, AssetImage selectedImage, String title) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: image),
      ),
      activeIcon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: selectedImage),
      ),
      label: '$title',
    );
  }
}
