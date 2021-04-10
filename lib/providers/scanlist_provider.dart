import 'package:flutter/material.dart';
import 'package:lect_qr/providers/db_providers.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asignar el Id de la base de datos al modelo
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScan();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.tipoSeleccionado = tipo;
    this.scans = [...scans];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.borrarTodo();
    this.scans = [];
    notifyListeners();
  }

  borraPorId(int id) async {
    await DBProvider.db.borrarUnDato(id);
    cargarScansPorTipo(this.tipoSeleccionado);
  }
}
