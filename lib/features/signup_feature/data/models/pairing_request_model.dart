import '../../domain/entities/pairing_request_entity.dart';

class PairingRequestModel extends PairingRequestEntity {
  PairingRequestModel({providerCode, deviceCode, deviceSecret, agentCode, fcmToken,deviceSerialNum,lat,lng})
      : super(
            providerCode: providerCode,
            deviceCode: deviceCode,
            deviceSecret: deviceSecret,
            agentCode: agentCode,
            fcmToken: fcmToken,
            deviceSerialNum: deviceSerialNum,
            lat: lat,
            lng:lng,
  );

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
