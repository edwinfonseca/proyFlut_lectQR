import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lect_qr/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.seleccionMenu;
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.seleccionMenu = i,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_input_antenna), label: 'Direcciones'),
        ]);
  }
}
