import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/screens/chat_support_section/chat_support_live.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/sized_widget.dart';
class ChatSupportStart extends StatelessWidget {
  const ChatSupportStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,

            children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("Chat Support",style: Constant.textProfile,),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            SizedBox(height: 10.h),
            Center(child: Image.asset("assets/png/chatSupport.png",width: 340.px,height: 266.px,)),
            getVerticalSpace(2.h),
            Text("Live Chat Support",style: Constant.textNameBlack6,),
            getVerticalSpace(1.h),
            Text("""Live chat support is a way for customers to get help through \ninstant messaging platforms.""",style: Constant.textNameBlack9,textAlign: TextAlign.center,),
            getVerticalSpace(6.h),
            CustomElevatedButton(width: 240.px,height: 37.px,
                text: "Start Chat", onPressed: (){
                  Get.to(()=>const ChatSupportLive());
                })
          ],),
        ),
      ),
    );
  }
}
