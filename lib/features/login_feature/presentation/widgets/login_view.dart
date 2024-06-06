import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/login_bloc.dart';
import '../screens/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.deviceCode,
    required this.providerCode,
  });

  final String deviceCode;
  final String providerCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.deepRed,
          body: LoginViewBody(
            deviceCode: deviceCode,
            providerCode: providerCode,
          ),
        ),
      ),
    );
  }
}
