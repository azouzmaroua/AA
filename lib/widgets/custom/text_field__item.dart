import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/widgets/space_widgets.dart';
import 'package:flutter/cupertino.dart';

class CompleteInfoItem extends StatelessWidget {
  const CompleteInfoItem(
      {Key? key,
      required this.text,
      this.inputType,
      this.maxLines,
      this.suffexIcon,
      this.controller})
      : super(key: key);
  final String text;
  final TextInputType? inputType;
  final int? maxLines;
  final Widget? suffexIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color.fromARGB(255, 73, 73, 73),
            fontWeight: FontWeight.w600,
            height: 1.5625,
          ),
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(2),
        CustomTextFormField(
          maxLines: maxLines,
          inputType: inputType,
          onSaved: (value) {},
          controller: controller,
          suffexIcon: suffexIcon,
        )
      ],
    );
  }
}
