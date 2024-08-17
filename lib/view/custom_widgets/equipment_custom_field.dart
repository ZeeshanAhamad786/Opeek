import 'package:flutter/material.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class EquipmentCustomField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;

  // final TextEditingController controller;
  final TextInputType keyboardType;

  const EquipmentCustomField({
    super.key,
    this.obscureText = false,
     this.hintText,
    // required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),boxShadow: [
        BoxShadow(color:  Colors.black.withOpacity(0.05),spreadRadius: 0,blurRadius: 8,offset: const Offset(0, 2))
      ],color: Colors.white),
      child: TextFormField(
        cursorColor: MyColor.orangeColor,
        // controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
           isDense: true,
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,hintStyle: TextStyle(fontSize: 12.px,color: MyColor.greyColor1,fontWeight: FontWeight.w400),

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

//

