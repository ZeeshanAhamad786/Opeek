import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/authentications/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_textfield_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Separate observables for password and confirm password visibility
  RxBool isPasswordObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(8.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new),
              ),
              getVerticalSpace(5.h),
              Text(
                "Welcome to, OPEEC",
                style: Constant.textWelcomeBlack,
              ),
              getVerticalSpace(1.h),
              Text(
                "Enter your OPEEC account to continue.",
                style: Constant.textAccountBlack,
              ),
              getVerticalSpace(5.h),
              Text("Your name", style: Constant.textEmailBlack),
              getVerticalSpace(.7),
              CustomTextFormField(
                hintText: 'Your name',
                controller: nameController,
              ),
              getVerticalSpace(2.h),
              Text("Email address", style: Constant.textEmailBlack),
              getVerticalSpace(.7),
              CustomTextFormField(
                hintText: 'Your email address',
                controller: emailController,
              ),
              getVerticalSpace(2.h),
              Text("Password", style: Constant.textEmailBlack),
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
              getVerticalSpace(2.h),
              Text("Confirm Password", style: Constant.textEmailBlack),
              getVerticalSpace(.7),
              Obx(() => CustomTextFormField(
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: isConfirmPasswordObscure.value,
                suffixIcon: SvgPicture.asset(
                  isConfirmPasswordObscure.value
                      ? "assets/svg/eye.svg"
                      : "assets/svg/closeEye.svg",
                ),
                onSuffixIconPressed: () {
                  toggleConfirmPasswordVisibility();
                },
              )),
              getVerticalSpace(3.h),
              CustomElevatedButton(text: "Sign-up ", onPressed: () {}),
              getVerticalSpace(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: MyColor.greyColor)),
                  getHorizontalSpace(.7.h),
                  Text("or Sign-up with", style: Constant.textWithBlack),
                  getHorizontalSpace(.7.h),
                  Expanded(child: Divider(color: MyColor.greyColor)),
                ],
              ),
              getVerticalSpace(3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/google.svg"),
                  getHorizontalSpace(2.h),
                  SvgPicture.asset("assets/svg/facebook.svg"),
                ],
              ),
              getVerticalSpace(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I have a OPEEC account?", style: Constant.textOpiBlack),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text("Login", style: Constant.textSignUpOrange),
                  ),
                ],
              ),
              SizedBox(height: 1.h, width: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
