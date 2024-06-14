import 'package:flutter/material.dart';
import 'package:pokemon_challenge/screens/home/screen_home.dart';

class PageNotifier extends ChangeNotifier {
  String? _pageName = ScreenHome.routeName;
  bool _unknownPath = false;

  get pageName => _pageName;
  get isUnknown => _unknownPath;

  changePage({required String? page, required bool unknown}) {
    _pageName = page;
    _unknownPath = unknown;
    notifyListeners();
  }
}