class Worker {
  String? id;
  String? code;
  String? providerId;
  String? providerCode;
  String? name;
  String? mobile;
  String? nid;
  dynamic photo;
  String? pinCode;
  String? status;
  dynamic statusNote;
  DateTime? lastLogin;
  String? loginToken;
  String? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic photoUrl;
  dynamic lat;
  dynamic lng;

  Worker(
      {this.id,
      this.code,
      this.providerId,
      this.providerCode,
      this.name,
      this.mobile,
      this.nid,
      this.photo,
      this.pinCode,
      this.status,
      this.statusNote,
      this.lastLogin,
      this.loginToken,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.photoUrl,
      this.lat,
      this.lng});

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
      id: json['id'] as String?,
      code: json['code'] as String?,
      providerId: json['provider_id'] as String?,
      providerCode: json['provider_code'] as String?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      nid: json['nid'] as String?,
      photo: json['photo'] as dynamic,
      pinCode: json['pin_code'] as String?,
      status: json['status'] as String?,
      statusNote: json['status_note'] as dynamic,
      lastLogin: json['last_login'] == null ? null : DateTime.parse(json['last_login'] as String),
      loginToken: json['login_token'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as dynamic,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] as dynamic,
      photoUrl: json['photo_url'] as dynamic,
      lat: json['lat'],
      lng: json['lng']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'provider_id': providerId,
        'provider_code': providerCode,
        'name': name,
        'mobile': mobile,
        'nid': nid,
        'photo': photo,
        'pin_code': pinCode,
        'status': status,
        'status_note': statusNote,
        'last_login': lastLogin?.toIso8601String(),
        'login_token': loginToken,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'photo_url': photoUrl,
        'lat': lat,
        'lng': lng
      };
}
