import 'package:hive/hive.dart';
part 'sayarah_model.g.dart';

@HiveType(typeId: 0)
class SayarahModel extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? channelName;
  @HiveField(2)
  final int? lastWorkingVer;
  @HiveField(3)
  final dynamic versionMsg;
  @HiveField(4)
  final String? status;
  @HiveField(5)
  final dynamic statusMsg;
  @HiveField(6)
  final String? baseUrl;
  @HiveField(7)
  final String? webviewUrl;
  @HiveField(8)
  final String? copyright;
  @HiveField(9)
  final List<dynamic>? setting;
  @HiveField(10)
  final dynamic createdBy;
  @HiveField(11)
  final dynamic updatedBy;
  @HiveField(12)
  final DateTime? createdAt;
  @HiveField(13)
  final DateTime? updatedAt;
  @HiveField(14)
  final dynamic deletedAt;

  SayarahModel({
    this.id,
    this.channelName,
    this.lastWorkingVer,
    this.versionMsg,
    this.status,
    this.statusMsg,
    this.baseUrl,
    this.webviewUrl,
    this.copyright,
    this.setting,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SayarahModel.fromJson(Map<String, dynamic> json) => SayarahModel(
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
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'channel_name': channelName,
        'last_working_ver': lastWorkingVer,
        'version_msg': versionMsg,
        'status': status,
        'status_msg': statusMsg,
        'base_url': baseUrl,
        'webview_url': webviewUrl,
        'copyright': copyright,
        'setting': setting,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };
}
