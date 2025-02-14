import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_textfield_screen.dart';
import '../../custom_widgets/sized_widget.dart';
class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmController=TextEditingController();
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
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            getVerticalSpace(9.h),
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new)),
            getVerticalSpace(3.h),
            Align(alignment: Alignment.topCenter,
                child: Text("Create a new password",style: Constant.textResetOrange,)),
            getVerticalSpace(1.h),
            Align(alignment: Alignment.topCenter,
                child: Text("Your new password must be different from previous\n used passwords.",
                  style: Constant.textWithBlack,textAlign: TextAlign.center,)),
              getVerticalSpace(10.h),
              Text("Enter Password",style: Constant.textEmailBlack,),
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
              Text("Confirm Password",style: Constant.textEmailBlack,),
              getVerticalSpace(.7),
              Obx(() => CustomTextFormField(
                hintText: 'Confirm Password',
                controller: confirmController,
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
              Center(child: CustomElevatedButton(text: "Save", onPressed: (){}))
          ],),
        ),
      ),
    );
  }
}
