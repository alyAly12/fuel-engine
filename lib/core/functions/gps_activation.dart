import 'package:location/location.dart';

Future<void> activateGps() async {
  Location location = Location();
  bool isOn = await location.serviceEnabled();
  if (!isOn) {
    bool isturnedon = await location.requestService();
    if (isturnedon) {
      print("GPS device is turned ON");
    } else {}
  }
}
