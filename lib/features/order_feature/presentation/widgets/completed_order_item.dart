import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_route.dart';

class CompletedOrdersItem extends StatelessWidget {
  const CompletedOrdersItem({super.key, required this.image, required this.color});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kOrdersDetails);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CustomTextWidget(
                      title: '30 L (Fuel 91)',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  title: 'F000123',
                  fontSize: 13,
                  color: AppColors.appBarColor,
                )
              ],
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextWidget(
                  title: '70 SAR',
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2,
                ),
                CustomTextWidget(
                  title: 'Sun Jul 9, 2023 @10:14 am',
                  fontSize: 13,
                  color: AppColors.appBarColor,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.arrowColor,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
