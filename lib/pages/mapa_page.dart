import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lect_qr/providers/db_providers.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType tipoMapa = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    //camara del mapa
    final CameraPosition puntoInicialCamara = CameraPosition(
      target: scan.getUbicacion(),
      zoom: 15,
    );
    //marcadores para el mapa
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
        markerId: MarkerId('geo-location'), position: scan.getUbicacion()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          mapType: tipoMapa,
          initialCameraPosition: puntoInicialCamara,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getUbicacion(), zoom: 15)));
            },
          ),
          SizedBox(height: 3.0),
          RaisedButton(
              child: Icon(Icons.map_outlined),
              onPressed: () {
                if (tipoMapa == MapType.normal) {
                  tipoMapa = MapType.satellite;
                } else {
                  tipoMapa = MapType.normal;
                }
                setState(() {});
              })
        ],
      ),
    );
  }
}
