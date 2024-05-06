class PairingRequestEntity {
  final String providerCode;
  final String deviceCode;
  final String deviceSecret;
  final String agentCode;
  final String fcmToken;
  final String deviceSerialNum;
  final double lat;
  final double lng;

  PairingRequestEntity(
      {required this.providerCode,
      required this.deviceCode,
      required this.deviceSecret,
      required this.agentCode,
      required this.fcmToken,
      required this.deviceSerialNum,
        required this.lat,
        required this.lng,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_code'] = providerCode;
    data['device_code'] = deviceCode;
    data['device_secret'] = deviceSecret;
    data['agent_code'] = agentCode;
    data['fcm_token'] = fcmToken;
    data['device_serial_num'] = deviceSerialNum;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
