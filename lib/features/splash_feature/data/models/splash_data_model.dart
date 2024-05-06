import 'package:hive/hive.dart';

class SplashDataModel extends HiveObject {
  final String? id;
  final String? channelName;
  final int? lastWorkingVer;
  final dynamic versionMsg;
  final String? status;
  final dynamic statusMsg;
  final String? baseUrl;
  final String? webviewUrl;
  final String? copyright;
  final List<dynamic>? setting;
  final dynamic createdBy;
  final dynamic updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  SplashDataModel(
      {required this.id,
      required this.channelName,
      required this.lastWorkingVer,
      required this.versionMsg,
      required this.status,
      required this.statusMsg,
      required this.baseUrl,
      required this.webviewUrl,
      required this.copyright,
      required this.setting,
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  factory SplashDataModel.fromJson(Map<String, dynamic> json) =>
      SplashDataModel(
        id: json['id'] as String?,
        channelName: json['channel_name'] as String?,
        lastWorkingVer: json['last_working_ver'] as int?,
        versionMsg: json['version_msg'] as dynamic,
        status: json['status'] as String?,
        statusMsg: json['status_msg'] as dynamic,
        baseUrl: json['base_url'] as String?,
        webviewUrl: json['webview_url'] as String?,
        copyright: json['copyright'] as String?,
        setting: json['setting'] as List<dynamic>?,
        createdBy: json['created_by'] as dynamic,
        updatedBy: json['updated_by'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );
}
