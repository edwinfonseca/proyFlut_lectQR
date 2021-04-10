import 'package:flutter/material.dart';
import 'package:lect_qr/providers/scanlist_provider.dart';
import 'package:lect_qr/widgets/scan_button.dart';

import 'package:lect_qr/providers/db_providers.dart';
import 'package:provider/provider.dart';
import 'package:lect_qr/providers/ui_provider.dart';

import 'package:lect_qr/pages/direcciones_page.dart';
import 'package:lect_qr/pages/mapa_page.dart';
import 'package:lect_qr/pages/mapas_page.dart';

import 'package:lect_qr/widgets/custom_navigatorbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el la seleccionMenu
    final uiProvider = Provider.of<UiProvider>(context);

    //cambiar para cambiar pagina respectiva
    final indexSeleccionado = uiProvider.seleccionMenu;

    // TODO: probar las consultas de datos
    //DBProvider.db.database;
    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanbyId(3).then((scan) => print(scan.valor));
    //DBProvider.db.getTodosLosScan().then((value) => print(value));
    //final nuevoScan = new ScanModel(id: 1, tipo: 'nada', valor: 'este');
    //DBProvider.db.actualizarDatos(nuevoScan);
    //DBProvider.db.borrarTodo().then((value) => print('Borro ${value} registros'));

    //usar el scan List Provider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (indexSeleccionado) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
        //Todo return Op_ListScans(tipo: 'geo'); se puede usar asi hay q probarlo
        break;
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
