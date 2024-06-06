import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuelsystem/features/signup_feature/presentation/widgets/show_qr_code_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/auth_validator.dart';
import '../../../../core/component/custom_button.dart';
import '../../../../core/component/lazy_loading_compponent.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/pairing_request_entity.dart';
import '../bloc/pairing_bloc/pairing_bloc.dart';
import 'custom_text_field.dart';
import 'device_id_container.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController providerCode;

  late TextEditingController deviceCode;

  late TextEditingController deviceSecret;
  late TextEditingController agentCode;
  late FocusNode providerFocus;
  late FocusNode deviceFocus;
  late FocusNode secretFocus;
  late FocusNode agentFocus;
  String? token;
  String? _deviceId;
  late Position position;
  bool isLoading = false;

  late LocationPermission permission;

  Future<Object> getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


  @override
  void initState() {
    getLocation();
    providerCode = TextEditingController();
    deviceCode = TextEditingController();
    deviceSecret = TextEditingController();
    agentCode = TextEditingController();
    providerFocus = FocusNode();
    deviceFocus = FocusNode();
    secretFocus = FocusNode();
    agentFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    providerCode.dispose();
    deviceCode.dispose();
    deviceSecret.dispose();
    agentCode.dispose();
    providerFocus.dispose();
    deviceFocus.dispose();
    secretFocus.dispose();
    agentFocus.dispose();
    super.dispose();
  }

  Future<void> installationFun() async {
    setState(() {
      isLoading = true;
    });
    var deviceId = await PlatformDeviceId.getDeviceId;
    _deviceId = deviceId;
    final isValid = formKey.currentState!.validate();
    token = await FirebaseMessaging.instance.getToken();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
      setState(() {
        isLoading = false;
      });

      return;
    } else if  (permission == LocationPermission.deniedForever) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions');
      return;
    }

    if (isValid) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      formKey.currentState!.save();
      sl<PairingBloc>().add(
        PairingUserEvent(
          pairingRequestEntity: PairingRequestEntity(
            providerCode: providerCode.text,
            deviceCode: deviceCode.text,
            deviceSecret: deviceSecret.text,
            agentCode: agentCode.text,
            fcmToken: token!,
            deviceSerialNum: _deviceId.toString(),
            lat: position.latitude,
            lng: position.longitude,
          ),
        ),
      );

      print(position);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? deviceId;
    Size size = MediaQuery.of(context).size;

    return BlocProvider<PairingBloc>(
      create: (context) => PairingBloc()..add(GetDeviceIdNumberEvent(deviceId)),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    AssetsManager.appLogo,
                    height: 30,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  BlocBuilder<PairingBloc, PairingState>(
                    builder: (context, state) {
                      if (state is GetDeviceIdNumberState) {
                        return DeviceIdContainer(
                          deviceId: state.deviceId,
                          onTap: () async {
                            await showQrCodeWidget(context,
                                data: state.deviceId);
                          },
                        );
                      }
                      return const DeviceIdContainer(
                        deviceId: '',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onlyRead: false,
                    styles:
                        const TextStyle(fontSize: 15, color: AppColors.appBarColor),
                    hintText: 'Provider code',
                    controller: providerCode,
                    focusNode: providerFocus,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(deviceFocus),
                    validator: (value) {
                      return AuthValidator.providerCodeValidator(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomTextField(
                    hintText: 'Device code',
                    styles:
                        const TextStyle(fontSize: 15, color: AppColors.appBarColor),
                    controller: deviceCode,
                    focusNode: deviceFocus,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(secretFocus),
                    validator: (value) {
                      return AuthValidator.deviceCodeValidator(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Device secret',
                    styles:
                        const TextStyle(fontSize: 15, color: AppColors.appBarColor),
                    controller: deviceSecret,
                    focusNode: secretFocus,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(agentFocus),
                    validator: (value) {
                      return AuthValidator.deviceSecretValidator(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Agent code',
                    styles:
                        const TextStyle(fontSize: 15, color: AppColors.appBarColor),
                    controller: agentCode,
                    focusNode: agentFocus,
                    validator: (value) {
                      return AuthValidator.agentCodeValidator(value);
                    },
                    nextAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  BlocProvider<PairingBloc>.value(
                    value: sl(),
                    child: BlocConsumer<PairingBloc, PairingState>(
                      listenWhen: (previous, current) => previous != current,
                      listener: (context, state) async {
                        if (state is PairingSuccessState) {
                          Fluttertoast.showToast(
                              msg: state.pairing.message.toString());
                          context.go(
                              '/loginView/${deviceCode.text}/${providerCode.text}');
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool(AppStrings.isRegister, true);
                        } else if (state is PairingFailureState) {
                          Fluttertoast.showToast(
                              msg: state.errorMessage.toString());
                          final dialogContext =
                              await dialogContextCompleter.future;
                          Navigator.pop(dialogContext);
                        }
                      },
                      builder: (context, state) {
                        return isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomLoginButton(
                                buttonHeight: size.width * 0.14,
                                onPressed: () async {
                                  await installationFun();
                                  print(state);
                                },
                                color: AppColors.redColor,
                                title: 'Activate',
                                textWeight: FontWeight.w500,
                                showIcon: false);
                      },
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

// void submitOnRegister() async {
//   final String? token = await FirebaseMessaging.instance.getToken();
//   final isValid = formKey.currentState!.validate();
//   FocusScope.of(context).unfocus();
//   if (isValid) {
//     formKey.currentState!.save();
//     PairingCubit().pairingData(
//       providerCode: providerCode.text,
//       deviceCode: deviceCode.text,
//       deviceSecret: deviceSecret.text,
//       agentCode: agentCode.text,
//       fcmToken: token!,
//     );
//   }
// }
}
// if (state is PairingSuccessState) {
// SharedPreferences prefs =
// await SharedPreferences.getInstance();
// await prefs.setBool(
// AppStrings.isRegister, true);
//
// }
// } else if (state is PairingFailureState) {
// return ;
// }
