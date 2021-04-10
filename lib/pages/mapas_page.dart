import 'package:flutter/material.dart';
import 'package:lect_qr/providers/scanlist_provider.dart';
import 'package:lect_qr/widgets/op_listscans.dart';
import 'package:provider/provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Op_ListScans(tipo: 'geo');
    /*
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans; //objeto
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Icon(
            Icons.delete,
          ),
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borraPorId(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            Icons.add_location_rounded,
            color: Colors.blueGrey,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => print('abrir el Qr...${scans[i].id}'),
        ),
      ),
    );*/
  }
}
