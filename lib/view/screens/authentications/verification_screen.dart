import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/authentications/create_new_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otpCodeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(10.h),
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: Icon(Icons.arrow_back_ios_new)),
              getVerticalSpace(3.2.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("Enter the verification code",style: Constant.textResetOrange,)),
              getVerticalSpace(.5.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("We have just sent you a 6-digit code on ",
                    style: Constant.textWithBlack,textAlign: TextAlign.center,)),
              getVerticalSpace(.5.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("example@gmail.com",
                    style: Constant.textExampleBlack,)),
              SizedBox(height: 10.h),
              PinCodeTextField(
                controller: otpCodeTextController,
                onCompleted: (v) {
                  otpCodeTextController.text = v;
                },
                length: 4,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                cursorColor: MyColor.orangeColor,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 52,
                  fieldWidth: 52,
                  inactiveColor: MyColor.greyColor,
                  selectedColor: MyColor.orangeColor,
                  activeColor: MyColor.orangeColor,
                  borderWidth: 0,
                ),
                animationDuration: const Duration(milliseconds: 200),
                onChanged: (value) {
                  log(value);
                },
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
                appContext: context,
                textStyle: const TextStyle(color:MyColor.blackColor),
              ),
              getVerticalSpace(10.h),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't receive?",style: Constant.textOtpBlack,),
                  getHorizontalSpace(.5.h),
                  GestureDetector(onTap: () {
                  },
                      child: Text("59",style: Constant.textSignUpOrange,)),
                ],
              ),
              SizedBox(height: 1.1.h),
              CustomElevatedButton(
                text: "Next",
                onPressed: () {
                 Get.to(()=>const CreateNewPassword());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
