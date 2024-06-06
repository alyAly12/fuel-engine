import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/app_colors.dart';
import '../utils/app_dialog.dart';
import 'custom_dotted_camera_container.dart';
import 'dart:io';
import 'custom_text_widget.dart';

class PickImageFunction extends StatelessWidget {
  const PickImageFunction(
      {super.key,
      required this.pickedImage,
      required this.image,
      this.imagePickerFun,
      this.removeTheImage,
      required this.file,
      required this.title,
      this.titleColor});
  final XFile? pickedImage;
  final String image;
  final Function()? imagePickerFun;
  final Function()? removeTheImage;
  final String? file;
  final String title;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pickedImage == null) ...[
          CustomDottedCameraContainer(
            color: Colors.grey,
            image: image,
            onTap: imagePickerFun,
          ),
        ] else ...[
          GestureDetector(
            onTap: () {
              DialogsServices.appDialog(
                  context: context,
                  title: 'Want to Change image',
                  fct: () {
                    removeTheImage!();
                  });
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
              child: ClipOval(
                child: Image.file(
                  File(file!),
                  filterQuality: FilterQuality.high,
                  // cacheHeight: 66,
                  // cacheWidth: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ],
        CustomTextWidget(
          title: title,
          color: titleColor ?? AppColors.appBarColor,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
// Column(children: [
//   if (_pickedImage3 == null) ...[
//     CustomDottedCameraContainer(
//       image: AssetsManager.gasLogo,
//       onTap: () {
//         localImagePicker3();
//       },
//     ),
//   ] else ...[
//     GestureDetector(
//       onTap: (){
//         DialogsServices.appDialog(
//             context: context,
//             title: 'Want to Change image',
//             fct: (){
//               removePickedImage();
//             }
//         );
//       },
//       child: Container(
//         width: 20.h,
//         height: 20.h,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle, color: Colors.transparent),
//         child:
//         ClipOval(
//           child: Image.file(
//             File(_pickedImage3!.path),
//             filterQuality: FilterQuality.high,
//             cacheHeight: 66,
//             cacheWidth: 50,
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//           ),
//         ),
//       ),
//     ),
//   ],
//   CustomTextWidget(title: 'car',color: Colors.white,fontSize: 8.sp,fontWeight: FontWeight.w500,)
// ],),
