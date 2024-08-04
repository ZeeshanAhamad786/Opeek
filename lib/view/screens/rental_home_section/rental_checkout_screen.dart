import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';
import '../payment_method/payment_method.screen.dart';

class RentalCheckOutScreen extends StatefulWidget {
  const RentalCheckOutScreen({super.key});

  @override
  State<RentalCheckOutScreen> createState() =>
      _RentalCheckOutScreenState();
}

class _RentalCheckOutScreenState extends State<RentalCheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
            Text(
              "Rental Checkout",
              style: Constant.textName // Adjust this as needed
            ),
            SizedBox(
              height: 10,
              width: 10,
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(2.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: MyColor.greyColor1.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Center the image vertically
                  children: [
                    Image.asset(
                      "assets/png/deliveryGlavz.png",
                      height: 100.px,
                      width: 120.px,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 2.h),
                    // Add space between the image and the text
                    Expanded(
                      // Add Expanded here to take available space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Align text to the start
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Center the text vertically
                        children: [
                          Text("Construction", style: Constant.textBlackColor5),
                          // Adjust text styles as needed
                          Text("Rotary Tool", style: Constant.textBlackColor),
                          SizedBox(height: 0.5.h),
                          Row(
                            children: [
                              RatingBar(
                                filledIcon: Icons.star,
                                filledColor: MyColor.orangeColor1,
                                size: 20,
                                // Adjusted size to be more visible
                                emptyIcon: Icons.star_border,
                                onRatingChanged: (value) => debugPrint('$value'),
                                initialRating: 5,
                                maxRating: 5,
                              ),
                              SizedBox(width: 1.h),
                              // Adjust spacing for better layout
                              Text("5.0", style: Constant.textNameBlack8),
                            ],
                          ),
                          getVerticalSpace(0.5.h),
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/location.svg"),
                              getHorizontalSpace(1.w),
                              Expanded(
                                child: Text(
                                  "Kent, Utah",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              getVerticalSpace(1.4.h),
              Text(
                "Delivery Address",
                style: Constant.textBlack,
              ),
              getVerticalSpace(1.h),
              Text(
                "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                style: Constant.textBlack6,
              ),
              getVerticalSpace(1.4.h),
              Text(
                "Rental Amount ",
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
              getVerticalSpace(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Protection money",
                    style: Constant.textBlackColor,
                  ),
                  Text(
                    "\$102 ",
                    style: Constant.textBlackColor,
                  ),
                ],
              ),
              getVerticalSpace(.6.h),
              Text(
                "((it will be refunded when you return the equipment)",
                style: Constant.textBl,
              ),

              getVerticalSpace(2.h),
              Divider(
                color: MyColor.greyColor,
              ),
              getVerticalSpace(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Constant.textBlackColor,
                  ),
                  Text(
                    "\$264 ",
                    style: Constant.textSignUpOrange,
                  ),
                ],
              ),
              getVerticalSpace(5.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                 Get.to(()=>const PaymentMethodScreen());
                  },
                  child: Text(
                    'Pay Now',
                    style: Constant.textCancel,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.orangeColor1,
                    padding: EdgeInsets.symmetric(
                      vertical: 1.5.h,
                      horizontal: 25.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}