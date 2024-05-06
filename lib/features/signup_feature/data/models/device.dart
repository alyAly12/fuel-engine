import 'dart:convert';

class Device {
  String? id;
  String? code;
  String? secret;
  String? serialNum;
  String? brand;
  String? providerId;
  String? providerCode;
  dynamic lastLoginWorkerId;
  dynamic lastLoginWorkerCode;
  dynamic assignedBy;
  String? activatedBy;
  dynamic activationDate;
  String? status;
  dynamic statusNote;
  dynamic lastLogin;
  String? fcmToken;
  String? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Device({
    this.id,
    this.code,
    this.secret,
    this.serialNum,
    this.brand,
    this.providerId,
    this.providerCode,
    this.lastLoginWorkerId,
    this.lastLoginWorkerCode,
    this.assignedBy,
    this.activatedBy,
    this.activationDate,
    this.status,
    this.statusNote,
    this.lastLogin,
    this.fcmToken,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Device.fromMap(Map<String, dynamic> data) => Device(
        id: data['id'] as String?,
        code: data['code'] as String?,
        secret: data['secret'] as String?,
        serialNum: data['serial_num'] as String?,
        brand: data['brand'] as String?,
        providerId: data['provider_id'] as String?,
        providerCode: data['provider_code'] as String?,
        lastLoginWorkerId: data['last_login_worker_id'] as dynamic,
        lastLoginWorkerCode: data['last_login_worker_code'] as dynamic,
        assignedBy: data['assigned_by'] as dynamic,
        activatedBy: data['activated_by'] as String?,
        activationDate: data['activation_date'] as dynamic,
        status: data['status'] as String?,
        statusNote: data['status_note'] as dynamic,
        lastLogin: data['last_login'] as dynamic,
        fcmToken: data['fcm_token'] as String?,
        createdBy: data['created_by'] as String?,
        updatedBy: data['updated_by'] as dynamic,
        createdAt: data['created_at'] == null ? null : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null ? null : DateTime.parse(data['updated_at'] as String),
        deletedAt: data['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'code': code,
        'secret': secret,
        'serial_num': serialNum,
        'brand': brand,
        'provider_id': providerId,
        'provider_code': providerCode,
        'last_login_worker_id': lastLoginWorkerId,
        'last_login_worker_code': lastLoginWorkerCode,
        'assigned_by': assignedBy,
        'activated_by': activatedBy,
        'activation_date': activationDate,
        'status': status,
        'status_note': statusNote,
        'last_login': lastLogin,
        'fcm_token': fcmToken,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Device].
  factory Device.fromJson(String data) {
    return Device.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Device] to a JSON string.
  String toJson() => json.encode(toMap());
}
