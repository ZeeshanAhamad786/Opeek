import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/authentications/login_screen.dart';
import 'package:opeec/view/screens/authentications/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  RxBool isFirstButtonActive = true.obs;

  @override
  Widget build(BuildContext context) {
    return
     Obx(() =>  Scaffold(
       backgroundColor: Colors.white,
       body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 5.h),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [

               getVerticalSpace(35.h),
               Center(child: SvgPicture.asset("assets/svg/logo.svg")),
               getVerticalSpace(12.h),
                Text("Explore with Ease",style: Constant.textExploreBlack,),
               getVerticalSpace(3.h),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                   foregroundColor: isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   backgroundColor: isFirstButtonActive.value ? MyColor.orangeColor : Colors.white,
                   side: const BorderSide(color: MyColor.orangeColor, width: 2),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
                 onPressed: () {
                   Get.off(() => const SignUpScreen());
                   isFirstButtonActive.value = true;
                 },
                 child: Text(
                   "Signup",
                   style: TextStyle(
                     color: isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   ),
                 ),
               ),
               getVerticalSpace(1.2.h),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                   foregroundColor: !isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   backgroundColor: !isFirstButtonActive.value ?MyColor.orangeColor : Colors.white,
                   side: const BorderSide(color: MyColor.orangeColor, width: 2),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
                 onPressed: () {
                   Get.off(()=>const LoginScreen());
                   isFirstButtonActive.value = false;

                 },
                 child: Text(
                   "Login",
                   style: TextStyle(
                     color: !isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   ),
                 ),
               ),
               getVerticalSpace(3.h),
                Text("or Start Searching",style: Constant.textStartBlack,),
               SizedBox(height: 40.px,width: 40.px,)
             ],
           ),
         ),
       ),
     ));
  }
}
