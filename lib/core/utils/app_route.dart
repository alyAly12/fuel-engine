import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/drawer_inner_screens/about_app_screen.dart';
import '../../features/drawer_inner_screens/complaint_screen.dart';
import '../../features/drawer_inner_screens/device_screen.dart';
import '../../features/home_feature/presentation/screens/home_view.dart';
import '../../features/login_feature/presentation/widgets/login_view.dart';
import '../../features/notification_feature/presentation/screens/notification_screen.dart';
import '../../features/order_feature/presentation/screens/order_view.dart';
import '../../features/order_feature/presentation/widgets/details/orders_detail.dart';
import '../../features/order_feature/presentation/widgets/order_filtering/order_filter.dart';
import '../../features/order_feature/presentation/widgets/order_result_screen.dart';
import '../../features/scan_feature/presentation/screens/confirm_fuel_amount_screen.dart';
import '../../features/scan_feature/presentation/screens/report_issue_screen.dart';
import '../../features/scan_feature/presentation/screens/scanning_screen.dart';
import '../../features/scan_feature/presentation/screens/start_fuel_vehicle.dart';
import '../../features/scan_feature/presentation/screens/vehicle_detail_screen.dart';
import '../../features/scan_feature/presentation/widgets/confirm_fuel_amout_widgets/confirm_success_screen.dart';
import '../../features/scan_feature/presentation/widgets/report_issue_widgets/issue_sent_screen.dart';
import '../../features/scan_feature/presentation/widgets/vehicle_details_widgets/not_the_same_vehicle_screen.dart';
import '../../features/scan_feature/presentation/widgets/vehicle_details_widgets/the_same_vehicle_screen.dart';
import '../../features/scan_feature/presentation/widgets/vehicle_registration_screen.dart';
import '../../features/setting_feature/presentation/screens/settings_view.dart';
import '../../features/setting_feature/presentation/widgets/inner_screen/help_and_support_screen.dart';
import '../../features/setting_feature/presentation/widgets/inner_screen/profile_info_screen.dart';
import '../../features/setting_feature/presentation/widgets/inner_screen/terms_and_condition_screen.dart';
import '../../features/signup_feature/presentation/screens/sign_up_view.dart';
import '../../features/splash_feature/presentation/screens/splash_view.dart';
import '../../features/splash_feature/presentation/screens/welcome_view.dart';
import '../../features/splash_feature/presentation/widgets/custom_page_transition.dart';
import '../../features/support_feature/presentation/screens/support_view.dart';
import '../../root_screen.dart';
import '../component/custom_success_screen.dart';
import '../component/vehicle_register_success.dart';
final _key = GlobalKey<NavigatorState>();
class AppRoute {

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get currentContext =>
      navigatorKey.currentState!.overlay!.context;

  static BuildContext get globalContext => navigatorKey.currentContext!;

  static const kLoginView = '/loginView/:deviceCode/:providerCode';
  static const kHomeView = '/homeView';
  static const kOrderView = '/orderView';
  static const kSettingsView = '/settingsView';
  static const kSupportView = '/supportView';
  static const kWelcomeView = '/welcomeView';
  static const kSignUpView = '/signupView';
  static const kRootScreen = '/rootScreen';
  static const kOrdersDetails = '/ordersDetail';
  static const kOrderFilter = '/orderFilter';
  static const kScanView = '/scanView';
  static const kReportIssue = '/reportIssue';
  static const kIssueSentScreen = '/issueSent';
  static const kVehicleDetailScreen = '/vehicleDetail';
  static const kNotSameVehicleScreen = '/notSameVehicle';
  static const kSameVehicleScreen = '/theSameVehicle';
  static const kStartFuelVehicle = '/startFuelVehicle';
  static const kConfirmFuelAmount = '/confirmFuelAmount';
  static const kConfirmSuccessScreen = '/confirmSuccess';
  static const kRegistrationScreen = '/registrationScreen';
  static const kProfileInfoScreen = '/profileScreen';
  static const kHelpScreen = '/helpScreen';
  static const kTermsScreen = '/termsScreen';
  static const kCustomSuccessScreen = '/customSuccessScreen';
  static const kFilterResultScreen = '/filterResultScreen';
  static const kSuccessRegisterScreen = '/successRegisterScreen';
  static const kDeviceScreen = '/deviceScreen';
  static const kAboutAppScreen = '/aboutAppScreen';
  static const kNetScreen = '/netScreen';
  static const kComplaintScreen = '/complaintScreen';
  static const kNotificationScreen = '/notificationScreen';
  static final router = GoRouter(
      navigatorKey: _key,
      routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      name: 'home-view',
      path: kHomeView,
      builder: (context, state) => const HomeView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HomeView(),
      ),
    ),
    GoRoute(
      name: 'order-view',
      path: kOrderView,
      builder: (context, state) => const OrderView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OrderView(),
      ),
    ),
    GoRoute(
      name: 'settings-view',
      path: kSettingsView,
      builder: (context, state) => const SettingsView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SettingsView(),
      ),
    ),
    GoRoute(
      name: 'support-view',
      path: kSupportView,
      builder: (context, state) => const SupportView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SupportView(),
      ),
    ),
    GoRoute(
      path: kWelcomeView,
      builder: (context, state) => const WelcomeView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const WelcomeView(),
      ),
    ),
    GoRoute(
      path:'/loginView/:deviceCode/:providerCode',
      builder: (context, state) => LoginView(
        deviceCode:state.pathParameters['deviceCode']!,
        providerCode: state.pathParameters['providerCode']!,),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: LoginView(
            deviceCode:state.pathParameters['deviceCode']!,
            providerCode:state.pathParameters['providerCode']!
        ),
      ),
    ),
    GoRoute(
      path: kRootScreen,
      builder: (context, state) => const RootScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const RootScreen(),
      ),
    ),
    GoRoute(
      name: 'orders-detail',
      path: kOrdersDetails,
      builder: (context, state) => const OrdersDetail(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OrdersDetail(),
      ),
    ),
    GoRoute(
      name: 'orders-filter',
      path: kOrderFilter,
      builder: (context, state) => const OrderFilter(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OrderFilter(),
      ),
    ),
    GoRoute(
      name: 'scan-view',
      path: kScanView,
      builder: (context, state) => const ScanningView(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ScanningView(),
      ),
    ),
    GoRoute(
      name: 'report-issue',
      path: kReportIssue,
      builder: (context, state) => const ReportIssueScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ReportIssueScreen(),
      ),
    ),
    GoRoute(
      name: 'issue-sent',
      path: kIssueSentScreen,
      builder: (context, state) => const IssueSentScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const IssueSentScreen(),
      ),
    ),
    GoRoute(
      name: 'vehicle-detail',
      path: kVehicleDetailScreen,
      builder: (context, state) => const VehicleDetailsScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const VehicleDetailsScreen(),
      ),
    ),
    GoRoute(
      name: 'not-same-vehicle',
      path: kNotSameVehicleScreen,
      builder: (context, state) => const NotTheSameVehicleScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const NotTheSameVehicleScreen(),
      ),
    ),
    GoRoute(
      name: 'the-same-vehicle',
      path: kSameVehicleScreen,
      builder: (context, state) => const TheSameVehicleScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const TheSameVehicleScreen(),
      ),
    ),
    GoRoute(
      name: 'start-fuel',
      path: kStartFuelVehicle,
      builder: (context, state) => const StartFuelVehicle(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const StartFuelVehicle(),
      ),
    ),
    GoRoute(
      name: 'fuel-amount',
      path: kConfirmFuelAmount,
      builder: (context, state) => const ConfirmFuelAmountScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ConfirmFuelAmountScreen(),
      ),
    ),
    GoRoute(
      name: 'confirm-success',
      path: kConfirmSuccessScreen,
      builder: (context, state) => const ConfirmSuccessScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ConfirmSuccessScreen(),
      ),
    ),
    GoRoute(
      name: 'registration-screen',
      path: kRegistrationScreen,
      builder: (context, state) => const VehicleRegistrationScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const VehicleRegistrationScreen(),
      ),
    ),
    GoRoute(
      name: 'profile-screen',
      path: kProfileInfoScreen,
      builder: (context, state) => const ProfileInfoScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ProfileInfoScreen(),
      ),
    ),
    GoRoute(
      name: 'help-screen',
      path: kHelpScreen,
      builder: (context, state) => const HelpScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HelpScreen(),
      ),
    ),
    GoRoute(
      name: 'terms-screen',
      path: kTermsScreen,
      builder: (context, state) => const TermsScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const TermsScreen(),
      ),
    ),
    GoRoute(
      name: 'custom-success-screen',
      path: kCustomSuccessScreen,
      builder: (context, state) => const CustomSuccessScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const CustomSuccessScreen(),
      ),
    ),
    GoRoute(
      name: 'filter-result',
      path: kFilterResultScreen,
      builder: (context, state) => const OrderFilterResult(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const OrderFilterResult(),
      ),
    ),
    GoRoute(
      name: 'register-success',
      path: kSuccessRegisterScreen,
      builder: (context, state) => const VehicleRegisterSuccess(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const VehicleRegisterSuccess(),
      ),
    ),
    GoRoute(
      name: 'device-success',
      path: kDeviceScreen,
      builder: (context, state) => const DeviceScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const DeviceScreen(),
      ),
    ),
    GoRoute(
      name: 'about-app',
      path: kAboutAppScreen,
      builder: (context, state) => const AboutAppScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const AboutAppScreen(),
      ),
    ),
    GoRoute(
      name: 'complaint-screen',
      path: kComplaintScreen,
      builder: (context, state) => const ComplaintScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ComplaintScreen(),
      ),
    ),
    GoRoute(
      name: 'notification-screen',
      path: kNotificationScreen,
      builder: (context, state) => const NotificationScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const NotificationScreen(),
      ),
    ),
  ]);
}
