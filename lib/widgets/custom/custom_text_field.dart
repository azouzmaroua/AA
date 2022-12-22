import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final Widget? prefixIcon;
  final String? hintText;

  final ValueSetter? onSaved;
  final ValueSetter? onChanged;

  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    @required this.inputType,
    this.suffexIcon,
    this.prefixIcon,
    this.hintText,
    @required this.onSaved,
    this.onChanged,
    this.maxLines,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffexIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFCCCCCC),
            )),
      ),
    );
  }
}
