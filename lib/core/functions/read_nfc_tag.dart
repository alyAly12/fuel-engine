import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:go_router/go_router.dart';
import '../component/custom_text_widget.dart';
import '../component/lazy_loading_compponent.dart';
import '../utils/app_route.dart';

void readNFCTag(BuildContext context) async {
  String selectedZoneId;
  var availability = await FlutterNfcKit.nfcAvailability;
  if (availability != NFCAvailability.available) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('NFC not available'), backgroundColor: Colors.black,duration: Duration(seconds: 5),));
    lazyLoadingComponent(context, const AlertDialog(
      contentPadding: EdgeInsets.all(12),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextWidget(title:'NFC not available,please reconnect',fontSize: 14,),
          Icon(Icons.close,color: Colors.red,size: 30,)
        ],
      ),
    ));
    return;
  }else{
    final dialogContext = await dialogContextCompleter.future;
    Navigator.pop(dialogContext);
  }
  await FlutterNfcKit.finish();

  if (Platform.isAndroid) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Scanning Nfc Tag'), backgroundColor: Colors.black));
  }

  var tag = await FlutterNfcKit.poll(
      timeout: const Duration(seconds: 50),
      iosMultipleTagMessage: "Multiple tags found!",
      iosAlertMessage: "Scan your tag");
  debugPrint(jsonEncode(tag));

  // if (tag.ndefAvailable!) {
  var record = tag.id;
  String zoneId = record.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)}:");
  selectedZoneId = zoneId.substring(0, zoneId.length - 1);
  debugPrint(selectedZoneId);
  // }

  if (Platform.isAndroid) {
    GoRouter.of(context).push(AppRoute.kVehicleDetailScreen);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tag ID:$selectedZoneId'), backgroundColor: Colors.black));
    await Future.delayed(const Duration(seconds: 1));
    await FlutterNfcKit.finish();
  } else if (selectedZoneId != selectedZoneId) {
    GoRouter.of(context).pushReplacement(AppRoute.kHelpScreen);
    await FlutterNfcKit.finish();
  }
}
