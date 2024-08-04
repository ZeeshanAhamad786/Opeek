import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/authentications/signup_screen.dart';
import 'package:opeec/view/screens/authentications/verification_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_textfield_screen.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(9.h),
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: Icon(Icons.arrow_back_ios_new)),
              getVerticalSpace(3.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("Reset Your Password",style: Constant.textResetOrange,)),
              getVerticalSpace(1.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("Enter your email and we'll send you a link to reset your\n password.",
                    style: Constant.textWithBlack,textAlign: TextAlign.center,)),
              getVerticalSpace(10.h),
              Text("Email address",style: Constant.textEmailBlack,),
              getVerticalSpace(.7),
              CustomTextFormField(hintText: 'Your email address',controller: emailController,),

              getVerticalSpace(2.h),
              Center(
                child: CustomElevatedButton(text: "Next", onPressed: (){
                  Get.to(()=>VerificationScreen());
                }),
              ),


            ],),
        ),
      ),
    );
  }
}
