import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchCustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;

  const SearchCustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.orangeColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Transform.scale(scale: 0.4,
            child: prefixIcon),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 10.px, fontWeight: FontWeight.w400, color: MyColor.greyColor1),
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
