import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';

import '../../controller/utils/constant.dart';
class CustomAddCategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomAddCategoryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 500, // default width for buttons
    this.height = 45, // default width for buttons
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: MyColor.orangeColor,width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,style: Constant.textForgotOrange,
          // style: Constant.loginSignUpButton,
        ),
      ),
    );
  }
}
