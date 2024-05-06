import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/features/splash_feature/presentation/widgets/welcome_page_one.dart';
import 'package:sayarah/features/splash_feature/presentation/widgets/welcome_page_two.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_route.dart';
import 'custom_welcome_button.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({Key? key}) : super(key: key);

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [const WelcomeOne(), const WelcomeTwo()];
  @override
  void initState() {
    checkRegister();
    super.initState();
  }

  Future<void> checkRegister() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isRegister = await pref.getBool(AppStrings.isRegister) ?? false;
    if (isRegister) {
      GoRouter.of(context).pushReplacement(AppRoute.kLoginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Animate(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: [
            Positioned(
              bottom: size.height * 0.21,
              left: 0,
              right: 0,
              height: size.height * 0.06,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: _activePage == index
                                    ? AppColors.redColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                          )),
                ),
              ),
            ),
            PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              height: size.height * 0.1,
              child: CustomWelcomeButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRoute.kSignUpView);
                },
                title: AppStrings.buttonTitle2,
              ),
            )
          ],
        ).animate().fade(curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
