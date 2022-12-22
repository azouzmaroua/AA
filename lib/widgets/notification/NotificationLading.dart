import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';

//#############################################

//###############################################

messageLading(context) {
  return AwesomeDialog(
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: false,
    //   useRootNavigator: false,
    context: context,
    body: Container(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: Colors.grey,
            size: 90.0,
          ),
          const VerticalSpace(2),
          CustomText(
              text: "loading...",
              TextColor: Colors.black,
              TextSize: 19,
              TextWeight: FontWeight.w600)
        ],
      ),
    ),
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
  )..show();
}
