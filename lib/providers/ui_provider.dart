


import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _seleccionMenu=0;
  

  int get seleccionMenu{
    return this._seleccionMenu;
  }
  set seleccionMenu(int i){
    this._seleccionMenu=i;
    notifyListeners();
  }
}