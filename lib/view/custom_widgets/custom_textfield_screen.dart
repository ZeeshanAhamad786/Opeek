import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.orangeColor,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.px, fontWeight: FontWeight.w400, color: MyColor.blackColor2),
        contentPadding: EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColor.orangeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColor.greyColor),
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixIconPressed,
          child: Transform.scale(scale: 0.4, child: suffixIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
