import 'package:flutter/material.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/data/getOrders.dart';
import 'package:my_parfum/routes/Onboarding_screens/OnBoardingBody.dart';

class SplashView extends StatefulWidget {
  static const id = "SplashView";
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1900));
    fadingAnimation =
        Tween<double>(begin: 0, end: 2).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  FadeTransition(
                    opacity: fadingAnimation!,
                    child: const Text(
                      'MY PARFUM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(198, 43, 42, 42),
                      ),
                    ),
                  ),
                  Image.asset(
                    'images/myParfum.png',
                    width: SizeConfig.defaultSize! * 20,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          )),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed("OnBoardingViewBody");
    });
  }
}
