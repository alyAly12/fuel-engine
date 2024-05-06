// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sayarah/core/commom_state/location_cubit/location_cubit.dart';
// import 'package:sayarah/core/commom_state/network_cubit/internet_cubit.dart';
// import 'package:sayarah/core/component/custom_text_widget.dart';
// import 'package:sayarah/core/utils/app_colors.dart';
// import 'package:sayarah/core/utils/app_route.dart';
// import 'package:sayarah/core/utils/app_strings.dart';
// import 'package:sayarah/core/utils/assets_manager.dart';
// import 'package:sayarah/features/splash_feature/presentation/view/manager/internet_cubit/internet_cubit.dart';
// import 'package:sizer/sizer.dart';
//
// class CheckConnectionScreen extends StatelessWidget {
//   const CheckConnectionScreen({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Positioned(
//               bottom: 30.h,
//               left: 0,
//               child: SvgPicture.asset(AssetsManager.newBack, height: 300)),
//           Positioned(
//             top: 27.h,
//             left: 0,
//             right: 0,
//             child: SvgPicture.asset(
//               AssetsManager.logoImage,
//               height: 20.h,
//             ),
//           ),
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
//                           if(state is InternetDisconnected){
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
//                               state is InternetDisconnected
//                                   ? Icon(
//                                 Icons.close,
//                                 color: AppColors.activeColor,
//                                 size: 4.h,
//                               )
//                                   : Icon(
//                           Icons.check,
//                           color: AppColors.activeColor,
//                           size: 4.h,
//                           )
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
//
// // Center(
// // child: Padding(
// // padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical:2.h ),
// // child: Container(
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(12),
// // color: Colors.white,
// // ),
// // height:40.h,
// // width: double.infinity,
// // child: Padding(
// // padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.start,
// // children: [
// // Align(
// // alignment: Alignment.topCenter,
// // child: SvgPicture.asset(AssetsManager.danger,height: 70,)),
// // SizedBox(height: 3.h,),
// // CustomTextWidget(
// // title: 'Kindly check connection tools :',
// // color: AppColors.darkGrey,
// // fontSize: 12.sp,
// // fontWeight: FontWeight.w500,
// // ),
// // SizedBox(height: 3.h,),
// // CustomTextWidget(
// // title: 'Internet Connection',
// // fontSize: 10.sp,
// // fontWeight: FontWeight.w500,
// // color:  AppColors.darkGrey,
// // ),
// // SizedBox(height: 2.h,),
// // CustomTextWidget(
// // title: 'NFC connection',
// // fontSize: 10.sp,
// // fontWeight: FontWeight.w500,
// // color:  AppColors.darkGrey,
// // ),
// // SizedBox(height: 2.h,),
// // CustomTextWidget(
// // title: 'GPS location',
// // fontSize: 10.sp,
// // fontWeight: FontWeight.w500,
// // color:  AppColors.darkGrey,
// // ),
// // Spacer(),
// // Align(
// // alignment: Alignment.bottomRight,
// // child: CustomTextButton(
// // title: 'Active connection',
// // textSize: 12.sp,
// // textColor: AppColors.darkGrey,
// // onPressed: (){
// // AppSettings.openAppSettings(type: AppSettingsType.location,);
// // }))
// // ],
// // ),
// // ),
// // ),
// // ),
// // ),
