//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nfc_manager/nfc_manager.dart';
// import 'package:sayarah/core/component/custom_snack_bar.dart';
// import 'package:sayarah/core/utils/app_route.dart';
//
// Future<void>startNfcReading(BuildContext context)async{
//   // try{
//   //   bool _isAvailable = await NfcManager.instance.isAvailable();
//   //   if(_isAvailable){
//   //     NfcManager.instance.startSession(
//   //         onDiscovered: (NfcTag tag)async{
//   //           Ndef? ndef =Ndef.from(tag);
//   //           if(ndef ==null){
//   //             showCustomSnackBar(context, 'Tag is not compatible with NDEF');
//   //           }else{
//   //             var myTag = tag.data["mifareultralight"]["identifier"].map((e) => e.toRadixString(16).padLeft(2, '0')).join('');
//   //             var result;
//   //             result.value = myTag;
//   //             debugPrint(result);
//   //             showCustomSnackBar(context,myTag);
//   //             GoRouter.of(context).push(AppRoute.kVehicleDetailScreen);
//   //            // //  TODO: this way make sense to me but the issue is the mifare is unknown in the chip.
//   //            // Uint8List identifier =Uint8List.fromList(tag.data["mifareultralight"]['identifier']);
//   //            // final String? identify = identifier.map((e) =>e.toRadixString(16).padLeft(2, '0')).join(':');
//   //            // debugPrint(identify);
//   //             // TODO: this way might not be right.
//   //             // var payLoad = tag.data["Serial Number"];
//   //             // var stringPayLoad = String.fromCharCode(payLoad);
//   //             // debugPrint(stringPayLoad);
//   //           }
//   //         },
//   //     );
//   //     NfcManager.instance.stopSession();
//   //   }else{
//   //     showCustomSnackBar(context, 'NFC not available.');
//   //     debugPrint('NFC not available.');
//   //     // GoRouter.of(context).push(AppRoute.kVehicleDetailScreen);
//   //   }
//   // }catch(e){
//   //   showCustomSnackBar(context, 'Error reading NFC: $e');
//   //   debugPrint('Error reading NFC: $e');
//   // }
//
//
//
// }
// // void _startNFCReading() async {
// //   try {
// //     bool isAvailable = await NfcManager.instance.isAvailable();
// //
// //     //We first check if NFC is available on the device.
// //     if (isAvailable) {
// //       //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
// //       NfcManager.instance.startSession(
// //         onDiscovered: (NfcTag tag) async {
// //           // Process NFC tag, When an NFC tag is discovered, print its data to the console.
// //           debugPrint('NFC Tag Detected: ${tag.data}');
// //         },
// //       );
// //     } else {
// //       debugPrint('NFC not available.');
// //     }
// //   } catch (e) {
// //     debugPrint('Error reading NFC: $e');
// //   }
// // }
