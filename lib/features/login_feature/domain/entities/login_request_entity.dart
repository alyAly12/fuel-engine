class LoginRequestEntity {
  final String deviceCode;
  final String providerCode;
  final String pinCode;
  final double lat;
  final double lng;
  final String deviceOs;

  LoginRequestEntity(
      {required this.deviceCode,
      required this.providerCode,
      required this.pinCode,
      required this.lat,
      required this.lng,
      required this.deviceOs});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_code'] = deviceCode;
    data['provider_code'] = providerCode;
    data['worker_pin'] = pinCode;
    data['device_os'] = deviceOs;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
