import 'dart:convert';
import 'package:hive/hive.dart';
import '../../data/models/pairing_data_model.dart';
part 'handheld_model.g.dart';

@HiveType(typeId: 2)
class HandHeldModel extends HiveObject {
  @HiveField(0)
  PairingDataModel? data;
  @HiveField(1)
  String? message;
  @HiveField(2)
  List<dynamic>? error;
  @HiveField(3)
  bool? status;

  HandHeldModel({this.data, this.message, this.error, this.status});

  factory HandHeldModel.fromMap(Map<String, dynamic> data) => HandHeldModel(
        data: data['data'] == null
            ? null
            : PairingDataModel.fromMap(data['data'] as Map<String, dynamic>),
        message: data['message'] as String?,
        error: data['error'] as List<dynamic>?,
        status: data['status'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'message': message,
        'error': error,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HandHeldModel].
  factory HandHeldModel.fromJson(String data) {
    return HandHeldModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HandHeldModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
