import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:my_device_info_plus/my_device_info_plus.dart';
import 'package:sayarah/core/services/service_locator.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';
import 'package:sayarah/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:sayarah/core/component/custom_button.dart';
import 'package:sayarah/features/login_feature/presentation/screens/custom_login_container.dart';
import 'package:sayarah/features/login_feature/presentation/screens/custom_login_field.dart';
import 'package:sayarah/features/login_feature/presentation/screens/login_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../../core/utils/app_route.dart';
import '../../../../../../../core/utils/auth_validator.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody(
      {super.key, required this.deviceCode, required this.providerCode});

  final String deviceCode;
  final String providerCode;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController pinController;
  late FocusNode pinNode;
  bool obscureText = true;
  bool loading = false;
  String? _platform;

  String? _os_version;

  Future<dynamic> getDeviceInfo() async {
    var result = await MyDeviceInfoPlus.getDeviceInfo();
    setState(() {
      _platform = result['platform'];
      _os_version = result['os_version'];
    });
  }

  Future<Object> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
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
  //  getLocation();
    getDeviceInfo();
    pinController = TextEditingController();
    pinNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    pinNode.dispose();
    super.dispose();
  }

  Future<void> loginFun() async {
    setState(() {
      loading = true;
    });
    final isValid = formKey.currentState!.validate();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (isValid) {
      formKey.currentState!.save();
      sl<LoginBloc>().add(LoginUserEvent(
          loginRequestEntity: LoginRequestEntity(
        deviceCode: widget.deviceCode,
        providerCode: widget.providerCode,
        pinCode: pinController.text,
        deviceOs: '${_platform}, Build ${_os_version}',
        lat: position.latitude,
        lng: position.longitude,
      )));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppStrings.isLoggedIn, true);
      print(position);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Animate(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.075,
            ),
            SvgPicture.asset(AssetsManager.appLogoWhite),
            SizedBox(
              height: size.height * 0.04,
            ),
            CustomLoginContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeader(size: size),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    SubTitleWidget(
                      subTitle: AppStrings.welcome,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                    SizedBox(height: size.height * 0.04),
                    SubTitleWidget(
                      subTitle: AppStrings.pinCode,
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomLoginField(
                      controller: pinController,
                      focusNode: pinNode,
                      obscureText: obscureText,
                      validator: (value) {
                        return AuthValidator.pinCodeValidator(value);
                      },
                      onSaved: (value) {
                        pinController.text = value!;
                      },
                      onFieldSubmitted: (value)async {
                        await loginFun();
                      },
                      suffixOnPressed: () {
                        setState(() {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        });
                      },
                      formKey: formKey,
                    ),
                    SizedBox(height: size.height * 0.1),
                    BlocProvider<LoginBloc>.value(
                      value: sl(),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listenWhen: (previous, current) => previous != current,
                        listener: (context, state) async {
                          if (state is LoginSuccessState) {
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.pieChartColor,
                                msg: 'Successfully login');
                            GoRouter.of(context)
                                .pushReplacement(AppRoute.kRootScreen);
                          } else if (state is LoginFailureState) {
                            Fluttertoast.showToast(
                              backgroundColor: AppColors.stopColor,
                              msg: state.errorMessage.toString(),
                            );
                          }
                        },
                        builder: (context, state) {
                          return loading
                              ? Center(child: CircularProgressIndicator())
                              : CustomLoginButton(
                                  buttonHeight: size.width * 0.15,
                                  textSize: 17,
                                  textWeight: FontWeight.w500,
                                  onPressed: () async {
                                    await loginFun();
                                  },
                                  color: AppColors.redColor,
                                  title: AppStrings.login,
                                  showIcon: true,
                                );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ).animate().slide(
            begin: const Offset(0, 2),
            end: const Offset(0, 0),
            duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
