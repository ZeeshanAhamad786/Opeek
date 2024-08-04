import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CustomDescriptionTextfield extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  // final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomDescriptionTextfield({
    super.key,
    this.obscureText = false,
    // required this.controller,
    this.keyboardType = TextInputType.text,
     this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),boxShadow: [
        BoxShadow(color:  Colors.white.withOpacity(0.1),spreadRadius: 0,blurRadius: 8,offset: const Offset(0, 2))
      ],color: Colors.white),
      child: TextFormField(
        maxLines: 3,
        cursorColor: MyColor.orangeColor,
        // controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,hintStyle: TextStyle(fontSize: 12.px,fontWeight: FontWeight.w400, color:MyColor.blackColor6),
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: MyColor.orangeColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.1)),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
