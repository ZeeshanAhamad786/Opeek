import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';

import '../../controller/utils/constant.dart';
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 500, // default width for buttons
    this.height = 45, // default width for buttons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColor.orangeColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: MyColor.orangeColor,width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(fit: BoxFit.scaleDown,
          child: Text(
            text,style: Constant.textSignUpWhite,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: Constant.loginSignUpButton,
          ),
        ),
      ),
    );
  }
}
