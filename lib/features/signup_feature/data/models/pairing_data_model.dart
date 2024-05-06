import 'dart:convert';
import 'device.dart';
import 'provider.dart';

class PairingDataModel {
  Device? device;
  Provider? provider;

  PairingDataModel({this.device, this.provider});

  factory PairingDataModel.fromMap(Map<String, dynamic> data) => PairingDataModel(
        device:
            data['device'] == null ? null : Device.fromMap(data['device'] as Map<String, dynamic>),
        provider: data['provider'] == null
            ? null
            : Provider.fromMap(data['provider'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'device': device?.toMap(),
        'provider': provider?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory PairingDataModel.fromJson(String data) {
    return PairingDataModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
