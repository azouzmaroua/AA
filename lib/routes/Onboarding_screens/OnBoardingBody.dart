import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/routes/Onboarding_screens/Costum_dot.dart';
import 'package:my_parfum/routes/Onboarding_screens/costum_page.dart';

class OnBoardingViewBody extends StatefulWidget {
  static const id = 'OnBoardingViewBody';
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            CustomPageView(pageController: pageController),
            Positioned(
              //  bottom: SizeConfig.defaultSize! * 24,
              // left: 0,
              //right: 0,
              child: CustomIndicator(
                dotIndex: pageController!.hasClients ? pageController?.page : 0,
              ),
            ),
            Visibility(
              visible: pageController!.hasClients
                  ? (pageController?.page == 2 ? false : true)
                  : true,
              child: Positioned(
                top: SizeConfig.defaultSize! * 7,
                right: SizeConfig.defaultSize! * 5,
                child: CustomText(
                    text: 'Skip',
                    TextSize: 14,
                    TextColor: Color(0xff898989),
                    TextWeight: FontWeight.normal),
              ),
            ),
            Positioned(
                left: SizeConfig.defaultSize! * 12,
                right: SizeConfig.defaultSize! * 12,
                bottom: SizeConfig.defaultSize! * 8,
                child: CustomGeneralButton(
                  onTap: () {
                    if (pageController!.page! < 2) {
                      pageController?.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed("Login Screen");
                    }
                  },
                  text: pageController!.hasClients
                      ? (pageController?.page == 2 ? 'Get started' : 'Next')
                      : 'Next',
                )),
          ],
        ),
      ),
    );
  }
}
