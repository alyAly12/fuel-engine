import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'core/commom_bloc/connection_check_bloc/connection_check_bloc.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_route.dart';
import 'core/utils/assets_manager.dart';
import 'features/home_feature/presentation/screens/home_view.dart';
import 'features/order_feature/presentation/screens/order_view.dart';
import 'features/setting_feature/presentation/screens/settings_view.dart';
import 'features/support_feature/presentation/screens/support_view.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> pages = [
    const HomeView(),
    const OrderView(),
    const SizedBox.shrink(),
    const SettingsView(),
    const SupportView()
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCheckBloc, ConnectionCheckState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: FloatingActionButton(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRoute.kScanView);
                  },
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.redColor,
                  child: SvgPicture.asset(
                    AssetsManager.addIcon,
                    height: 22,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedFontSize: 15,
                unselectedFontSize: 15,
                selectedItemColor: AppColors.redColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentScreen,
                onTap: (int index) {
                  setState(() {
                    currentScreen = index;
                  });
                  controller.jumpToPage(currentScreen);
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetsManager.homeIcon,
                      color: currentScreen == 0 ? AppColors.redColor : AppColors.lightTitleColor,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.orderIcon,
                        color: currentScreen == 1 ? AppColors.redColor : AppColors.lightTitleColor),
                    label: 'Orders',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.access_alarms_rounded,
                      size: 0,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.settingIcon,
                        color: currentScreen == 3 ? AppColors.redColor : AppColors.lightTitleColor),
                    label: 'Settings',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetsManager.supportIcon,
                      color: currentScreen == 4 ? AppColors.redColor : AppColors.lightTitleColor,
                    ),
                    label: 'Support',
                  ),
                ]));
      },
    );
  }
}
