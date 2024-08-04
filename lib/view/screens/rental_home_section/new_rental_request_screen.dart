import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';
import '../authentications/login_screen.dart';
class NewRentalRequestScreen extends StatelessWidget {
  const NewRentalRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isFirstButtonActive = true.obs;

    return
     Obx(() =>  Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(title: Text("New Rental Request",style: Constant.textBlack1,),
         centerTitle: true,automaticallyImplyLeading: false,),
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 3.h),
         child: SingleChildScrollView(
           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Column(
                 children: [
                   CircleAvatar(
                     backgroundImage: AssetImage("assets/png/profileImage.png"),
                     radius: 40,
                   ),
                   getVerticalSpace(1.h),
                   Text("Mohsin",style: Constant.textName,),
                   getVerticalSpace(.3.h),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       RatingBar(
                         filledIcon: Icons.star,
                         filledColor: MyColor.orangeColor1,
                         size: 16,
                         emptyIcon: Icons.star_border,
                         onRatingChanged: (value) => debugPrint('$value'),
                         initialRating: 5,
                         maxRating: 5,
                       ),
                       SizedBox(width: 0.5.h),
                       Text("5.0", style: Constant.textName2),
                     ],
                   ),
                 ],
               ),

               getVerticalSpace(3.h),
               Image.asset("assets/png/drillLarge.png"),
               getVerticalSpace(1.3.h),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                     color: MyColor.blueColor),
                 child: Text("Awaiting for your approval",style: Constant.textSignUpWhite1,),
               ),
               getVerticalSpace(1.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Equipment Name ",
                     style: Constant.textName,
                   ),
                   Spacer(),
                   Text(
                     "25",
                     style: Constant.textSignUpOrange,
                   ),
                   getHorizontalSpace(1.w),
                   Text(
                     "\$ 5 Day",
                     style: Constant.textBlackColor6,
                   ),
                 ],
               ),
               getVerticalSpace(2.h),
               Text(
                 "Rental Schedule",
                 style: Constant.textBlack,
               ),
               getVerticalSpace(1.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Mon, 22 Jul ",
                     style: Constant.textBlackColor,
                   ),
                   Text(
                     "To",
                     style: Constant.textSignUpOrange,
                   ),
                   Text(
                     "Wed, 25 Jul ",
                     style: Constant.textBlackColor,
                   ),
                 ],
               ),
               getVerticalSpace(1.3.h),
               Text(
                 "Delivery Address",
                 style: Constant.textBlack,
               ),
               getVerticalSpace(1.h),
               Text("2972 Westheimer Rd. Santa Ana, Illinois 85486 ",style: Constant.textBlackColor,),
               getVerticalSpace(1.3.h),
               Text(
                 "Rental Amount",
                 style: Constant.textBlack,
               ),
               getVerticalSpace(1.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "\$54.00 x 3day ",
                     style: Constant.textBlackColor,
                   ),
                   Text(
                     "\$162",
                     style: Constant.textBlackColor,
                   ),
                 ],
               ),
               getVerticalSpace(2.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Insurance charges",
                     style: Constant.textBlackColor,
                   ),
                   Text(
                     "-\$102 ",
                     style: Constant.textBlackColor,
                   ),
                 ],
               ),
               getVerticalSpace(.6.h),
               Text(
                 "(In case of damage or loss, you will receive a refund)",
                 style: Constant.textBl,
               ),
               getVerticalSpace(2.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Platform fee",
                     style: Constant.textBlackColor,
                   ),
                   Text(
                     "-\$10",
                     style: Constant.textBlackColor,
                   ),
                 ],
               ),
               getVerticalSpace(1.3.h),
               Divider(color: MyColor.greyColor,),
               getVerticalSpace(1.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Total earn",
                     style: Constant.textBlackColor,
                   ),
                   Text(
                     "\$142 ",
                     style: Constant.textSignUpOrange,
                   ),
                 ],
               ),
               getVerticalSpace(3.h),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                   foregroundColor: isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   backgroundColor: isFirstButtonActive.value ? MyColor.orangeColor : Colors.white,
                   side:  BorderSide(color:isFirstButtonActive.value ? MyColor.orangeColor:MyColor.redColor3, width: 2),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
                 onPressed: () {
                   // Get.off(() => const SignUpScreen());
                   isFirstButtonActive.value = true;
                 },
                 child: Text(
                   "Accept",
                   style: TextStyle(
                     color: isFirstButtonActive.value ? Colors.white : MyColor.redColor3,
                   ),
                 ),
               ),
               getVerticalSpace(1.2.h),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                   foregroundColor: !isFirstButtonActive.value ? Colors.white : MyColor.orangeColor,
                   backgroundColor: !isFirstButtonActive.value ?MyColor.orangeColor : Colors.white,
                   side:  BorderSide(color:isFirstButtonActive.value ? MyColor.redColor3:MyColor.orangeColor, width: 2),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
                 onPressed: () {
                   // Get.off(()=>const LoginScreen());
                   isFirstButtonActive.value = false;

                 },
                 child: Text(
                   "Decline",
                   style: TextStyle(
                     color: !isFirstButtonActive.value ? Colors.white : MyColor.redColor3,
                   ),
                 ),
               ),
               getVerticalSpace(3.h),getHorizontalSpace(3.h)
             ],),
         ),
       ),
     ));
  }
}

