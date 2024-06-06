import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';

class ActiveOrdersItem extends StatelessWidget {
  const ActiveOrdersItem({super.key, required this.image, required this.color});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(AppRoute.kStartFuelVehicle);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: 6,
              decoration: BoxDecoration(
                  color: color, shape: BoxShape.rectangle, border: Border.all(color: Colors.grey)),
            ),
            const SizedBox(
              width: 15,
            ),
            SvgPicture.asset(
              image,
              height: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: '7403-RUN',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  title: '30 L (Gas 91)70 SAR',
                  fontSize: 15,
                  color: AppColors.greyColor,
                )
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            const Column(
              children: [
                CustomTextWidget(
                  title: '2:30 min(s)',
                  fontSize: 15,
                  color: AppColors.activeColor,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  title: 'F000123',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.arrowColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
