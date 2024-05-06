import '../../data/models/pairing_data_model.dart';

class PairingResponseEntity {
  PairingDataModel? data;
  String? message;
  List<dynamic>? error;
  bool? status;

  PairingResponseEntity({this.data, this.message, this.error, this.status});
}
