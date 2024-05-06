// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import '../../features/splash_feature/presentation/view/manager/internet_cubit/internet_cubit.dart';
// import '../commom_state/location_cubit/location_cubit.dart';
// import '../utils/app_colors.dart';
// import 'custom_text_widget.dart';
//
// class InternetScreen extends StatelessWidget {
//   const InternetScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.grey.withOpacity(0.7)),
//           ),
//           Positioned.fill(
//             child: Padding(
//               padding: EdgeInsets.only(
//                   left: 10.w, right: 10.w, top: 30.h, bottom: 30.h),
//               child: Container(
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
//                   child: Column(
//                     children: [
//                       CustomTextWidget(
//                         title: 'Please check connection tools',
//                         fontSize: 11.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       SizedBox(
//                         height: 10.w,
//                       ),
//                       BlocConsumer<InternetCubit, InternetState>(
//                         listener: (context, state) {
//                           if(state is InternetNotConnectedState){
//                             return ;
//                           }
//                         },
//                         builder: (context, state) {
//                           return Row(
//                             children: [
//                               Icon(
//                                 Icons.wifi,
//                                 color: AppColors.appBarColor,
//                                 size: 3.h,
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               ),
//                               CustomTextWidget(
//                                 title: 'Internet Connection',
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.normal,
//                                 color: AppColors.lightTitleColor,
//                               ),
//                               Spacer(),
//                               state is InternetNotConnectedState
//                                   ? Icon(
//                                 Icons.close,
//                                 color: AppColors.activeColor,
//                                 size: 4.h,
//                               )
//                                   : Icon(
//                                 Icons.check,
//                                 color: AppColors.activeColor,
//                                 size: 4.h,
//                               )
//
//                             ],
//                           );
//                         },
//                       ),
//                       SizedBox(
//                         height: 5.w,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.nfc,
//                             color: AppColors.appBarColor,
//                             size: 3.h,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           CustomTextWidget(
//                             title: 'NFC Connection',
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.normal,
//                             color: AppColors.lightTitleColor,
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.check,
//                             color: AppColors.activeColor,
//                             size: 4.h,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.w,
//                       ),
//                       BlocBuilder<LocationCubit, LocationState>(
//                         builder: (context, state) {
//                           return Row(
//                             children: [
//                               Icon(
//                                 Icons.location_searching,
//                                 color: AppColors.appBarColor,
//                                 size: 3.h,
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               ),
//                               CustomTextWidget(
//                                 title: 'GPS Location',
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.normal,
//                                 color: AppColors.lightTitleColor,
//                               ),
//                               Spacer(),
//                               state is LocationOnState ?
//                               Icon(
//                                 Icons.check,
//                                 color: AppColors.activeColor,
//                                 size: 4.h,
//                               ) : Icon(
//                                 Icons.close,
//                                 color: AppColors.redColor,
//                                 size: 4.h,
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
