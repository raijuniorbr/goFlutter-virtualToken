import 'package:flutter/material.dart';
import 'package:virtualtoken/controllers/device_token_controller.dart';
import 'package:virtualtoken/models/device_token.dart';

class DeviceTokenTable extends StatelessWidget {
  final DeviceTokenController _deviceTokenController;
  final VoidCallback _refreshList;

  const DeviceTokenTable(this._deviceTokenController, this._refreshList, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DeviceToken>>(
        future: _deviceTokenController.getAllDeviceTokens(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text("Carregando ..."));
          } else {
            return DataTable(columns: _createDeviceTokenColumns(), rows: _createDeviceTokenRows(snapshot.data ?? []));
          }
        });
  }

  List<DataColumn> _createDeviceTokenColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Conta')),
      const DataColumn(label: Text('Ação')),
    ];
  }

  List<DataRow> _createDeviceTokenRows(List<DeviceToken> deviceTokens) {
    return deviceTokens
        .map((deviceToken) => DataRow(cells: [
              DataCell(Text('# + ${deviceToken.deviceId}')),
              DataCell(Text('${deviceToken.accountName} (${deviceToken.secretKeyURL})')),
              DataCell(IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await _deviceTokenController.removeDeviceTokens(deviceToken.deviceId);
                  _refreshList();
                },
              )),
            ]))
        .toList();
  }
}
