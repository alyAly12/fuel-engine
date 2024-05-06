import 'dart:convert';

class Provider {
  String? id;
  String? code;
  String? cityId;
  String? ownerId;
  String? walletNum;
  String? nameAr;
  String? nameEn;
  String? commercialRegisterNumber;
  dynamic commercialRegisterFile;
  String? status;
  String? logo;
  String? details;
  String? address;
  double? lat;
  double? lng;
  dynamic statusNote;
  dynamic sessionExpiration;
  int? gasStation;
  int? oilStore;
  int? washStation;
  int? repairShop;
  int? tireBattery;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? logoUrl;

  Provider({
    this.id,
    this.code,
    this.cityId,
    this.ownerId,
    this.walletNum,
    this.nameAr,
    this.nameEn,
    this.commercialRegisterNumber,
    this.commercialRegisterFile,
    this.status,
    this.logo,
    this.details,
    this.address,
    this.lat,
    this.lng,
    this.statusNote,
    this.sessionExpiration,
    this.gasStation,
    this.oilStore,
    this.washStation,
    this.repairShop,
    this.tireBattery,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.logoUrl,
  });

  factory Provider.fromMap(Map<String, dynamic> data) => Provider(
        id: data['id'] as String?,
        code: data['code'] as String?,
        cityId: data['city_id'] as String?,
        ownerId: data['owner_id'] as String?,
        walletNum: data['wallet_num'] as String?,
        nameAr: data['name_ar'] as String?,
        nameEn: data['name_en'] as String?,
        commercialRegisterNumber: data['commercial_register_number'] as String?,
        commercialRegisterFile: data['commercial_register_file'] as dynamic,
        status: data['status'] as String?,
        logo: data['logo'] as String?,
        details: data['details'] as String?,
        address: data['address'] as String?,
        lat: (data['lat'] as num?)?.toDouble(),
        lng: (data['lng'] as num?)?.toDouble(),
        statusNote: data['status_note'] as dynamic,
        sessionExpiration: data['session_expiration'] as dynamic,
        gasStation: data['gas_station'] as int?,
        oilStore: data['oil_store'] as int?,
        washStation: data['wash_station'] as int?,
        repairShop: data['repair_shop'] as int?,
        tireBattery: data['tire_battery'] as int?,
        createdBy: data['created_by'] as String?,
        updatedBy: data['updated_by'] as String?,
        createdAt: data['created_at'] == null ? null : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null ? null : DateTime.parse(data['updated_at'] as String),
        deletedAt: data['deleted_at'] as dynamic,
        logoUrl: data['logo_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'code': code,
        'city_id': cityId,
        'owner_id': ownerId,
        'wallet_num': walletNum,
        'name_ar': nameAr,
        'name_en': nameEn,
        'commercial_register_number': commercialRegisterNumber,
        'commercial_register_file': commercialRegisterFile,
        'status': status,
        'logo': logo,
        'details': details,
        'address': address,
        'lat': lat,
        'lng': lng,
        'status_note': statusNote,
        'session_expiration': sessionExpiration,
        'gas_station': gasStation,
        'oil_store': oilStore,
        'wash_station': washStation,
        'repair_shop': repairShop,
        'tire_battery': tireBattery,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'logo_url': logoUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Provider].
  factory Provider.fromJson(String data) {
    return Provider.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Provider] to a JSON string.
  String toJson() => json.encode(toMap());
}
