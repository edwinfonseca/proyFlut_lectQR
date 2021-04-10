import 'package:flutter/material.dart';
import 'package:lect_qr/providers/scanlist_provider.dart';
import 'package:lect_qr/providers/ui_provider.dart';
import 'package:lect_qr/pages/home_page.dart';
import 'package:lect_qr/pages/mapa_page.dart';
//import 'package:lect_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          /*esta es otra forma de definir el context en algunos casos
              'home':(_)=> HomePage(), */
          'home': (BuildContext context) => HomePage(),
          'mapa': (BuildContext context) => MapaPage(),
        },
        theme: ThemeData.dark(),
        /* theme: ThemeData(
              primaryColor: Colors.red,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.orange
              )
            ),
              */
      ),
    );
  }
}
