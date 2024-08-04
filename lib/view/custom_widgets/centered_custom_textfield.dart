import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CenteredTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  CenteredTextFormField({
    // required this.controller,
    this.hintText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
         borderRadius: BorderRadius.circular(32.px),
         boxShadow: [
           BoxShadow(color: MyColor.blackColor.withOpacity(0.1),offset: const Offset(0, 1),spreadRadius: 0,blurRadius: 4)
         ]
      ),
      child: TextFormField(
        // controller: controller,
        textAlign: TextAlign.center,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.px),borderSide:
          BorderSide(color:MyColor.greyColor.withOpacity(0.1) )),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.px),borderSide:
          const BorderSide(color: MyColor.orangeColor1)),
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,hintStyle: TextStyle(color: MyColor.greyColor4,fontSize: 10.px,fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.px),
          ),
        ),
      ),
    );
  }
}
