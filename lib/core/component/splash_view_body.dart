import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/component/subtitle_text_widget.dart';
import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Animate(
      child: Stack(children: [
        Positioned(top: 220, left: 0, child: SvgPicture.asset(AssetsManager.newBack, height: 300)),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 220),
                child: Center(
                    child: SvgPicture.asset(
                  AssetsManager.logoImage,
                  height: size.height * 0.17,
                )),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SubTitleWidget(
                              subTitle: '',
                              fontSize: 13,
                              color: AppColors.smallTitle,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ).animate(delay: const Duration(seconds: 1)),
        )
      ]),
    );
  }
}
