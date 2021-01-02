import 'package:flutter/material.dart';
import 'package:myapp/pages/home/PageHome.dart';
import 'package:myapp/pages/video/PageVideo.dart';
import 'package:myapp/pages/mine/PageMine.dart';
import 'package:english_words/english_words.dart';

class RootRouterManager {
  static RootRouterManager _instance;
  static RootRouterManager get instance => _getInstance();
  factory RootRouterManager() => _getInstance();
  RootRouterManager._init() {}
  static RootRouterManager _getInstance() {
    if (_instance == null) {
      print("init");
      _instance = new RootRouterManager._init();
    }
    return _instance;
  }

  int _selectIndex = 0;

  int get selectedIndex => _selectIndex;
  set selectedIndex(int index) {
    _selectIndex = index;
  }

  PagesManager _pagesManager = PagesManager();
  PagesManager get pagesManager => _pagesManager;

  TabBarManager _tabBarManager = TabBarManager((index) {
    RootRouterManager.instance.selectedIndex = index;
    RootRouterManager.instance.pagesManager.selectedPage = index;
    RootRouterManager.instance.notifyAll();
  });
  TabBarManager get tabBarManager => _tabBarManager;

  void notifyAll() {
    _pagesManager.notifyListeners();
    _tabBarManager.notifyListeners();
  }
}

class PagesManager with ChangeNotifier {
  int _selectedPage = 0;
  List<Widget> _pages = [];

  List _wordPair_suggestions = <WordPair>[];
  Set _wordPair_saved = new Set<WordPair>();

  PagesManager() {
    _initialPages();
  }

  int get selectedPage => _selectedPage;
  set selectedPage(int indext) {
    _selectedPage = indext;
  }

  // Pages
  List<Widget> _initialPages() {
    _pages.add(PageHome());
    _pages.add(PageVideo());
    _pages.add(PageMine());
    return _pages;
  }

  List<Widget> get pages => _pages;

  void get_suggestion() {
    _wordPair_suggestions.addAll(generateWordPairs().take(10));
    notifyListeners();
  }

  void save_suggestion(WordPair pair) {
    _wordPair_saved.add(pair);
    notifyListeners();
  }

  void del_suggestion(WordPair pair) {
    _wordPair_saved.remove(pair);
    notifyListeners();
  }
}

class TabBarManager with ChangeNotifier {
  ValueChanged<int> _valueChanged;

  TabBarManager(this._valueChanged);

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    this._valueChanged(index);
  }
}
