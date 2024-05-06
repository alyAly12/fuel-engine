import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({deviceCode, providerCode, pinCode, lat, lng,deviceOs})
      : super(
            deviceCode:deviceCode ,
            providerCode: providerCode,
            pinCode: pinCode,
            lat: lat,
            lng: lng,
            deviceOs: deviceOs
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_code'] = deviceCode;
    data['provider_code'] = providerCode;
    data['worker_pin'] = pinCode;
    data['device_os'] = deviceOs;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
