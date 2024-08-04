import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/authentications/reset_password_screen.dart';
import 'package:opeec/view/screens/authentications/signup_screen.dart';
import 'package:opeec/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:opeec/view/screens/home_section/search_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_textfield_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController emailController=TextEditingController();
 final TextEditingController passwordController=TextEditingController();
 RxBool isPasswordObscure = true.obs;
 void togglePasswordVisibility() {
   isPasswordObscure.value = !isPasswordObscure.value;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [getVerticalSpace(9.h),
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new)),
              getVerticalSpace(5.h),
              Text("Welcome to, OPEEC",style: Constant.textWelcomeBlack,),
              getVerticalSpace(1.h),
              Text("Enter your OPEEC account to continue.",style: Constant.textAccountBlack,),
              getVerticalSpace(5.h),
              Text("Email address",style: Constant.textEmailBlack,),
              getVerticalSpace(.7),
              CustomTextFormField(hintText: 'Your email address',controller: emailController,),
              getVerticalSpace(2.h),
              Text("Password",style: Constant.textEmailBlack,),
              getVerticalSpace(.7),
              Obx(() => CustomTextFormField(
                hintText: 'Your password',
                controller: passwordController,
                obscureText: isPasswordObscure.value,
                suffixIcon: SvgPicture.asset(
                  isPasswordObscure.value
                      ? "assets/svg/eye.svg"
                      : "assets/svg/closeEye.svg",
                ),
                onSuffixIconPressed: () {
                  togglePasswordVisibility();
                },
              )),
              getVerticalSpace(.7),
              Align(alignment: Alignment.centerRight,
                  child: GestureDetector(onTap: () {
                    Get.to(()=>const ResetPasswordScreen());
                  },
                      child: Text("Forgot password",style: Constant.textForgotOrange,))),
              getVerticalSpace(3.h),
              Center(
                child: CustomElevatedButton(text: "Login", onPressed: (){
                  Get.to(()=>const BottomNavigationScreen());
                }),
              ),
              getVerticalSpace(5.h),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: MyColor.greyColor,)),
                  getHorizontalSpace(.7.h),
                  Text("or login with",style: Constant.textWithBlack,),
                  getHorizontalSpace(.7.h),
                  Expanded(child: Divider(color: MyColor.greyColor,)),
                ],
              ),
              getVerticalSpace(3.h),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/google.svg"),
                  getHorizontalSpace(2.h),
                  SvgPicture.asset("assets/svg/facebook.svg"),
                ],
              ),
              getVerticalSpace(5.h),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't have a OPEEC account?",style: Constant.textOpiBlack,),
                  GestureDetector(onTap: () {
                    Get.to(()=>const SignUpScreen());
                  },
                      child: Text("Sign-up",style: Constant.textSignUpOrange,)),
                ],
              )
              
          ],),
        ),
      ),
    );
  }
}
