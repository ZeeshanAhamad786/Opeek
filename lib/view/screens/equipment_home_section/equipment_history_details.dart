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
import '../../custom_widgets/custom_description_textfield.dart';
import '../../custom_widgets/sized_widget.dart';

class EquipmentHistoryDetails extends StatefulWidget {
  const EquipmentHistoryDetails({super.key});

  @override
  State<EquipmentHistoryDetails> createState() =>
      _EquipmentHistoryDetailsState();
}

class _EquipmentHistoryDetailsState extends State<EquipmentHistoryDetails> {
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
              "Equipment Name",
              style: TextStyle(color: Colors.orange), // Adjust this as needed
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
              getVerticalSpace(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Insurance charges ",
                    style: Constant.textBlackColor,
                  ),
                  Text(
                    "-\$10 ",
                    style: Constant.textBlackColor,
                  ),
                ],
              ),
              getVerticalSpace(.6.h),
              Text(
                "(In case of damage or loss, you will receive a refund)",
                style: Constant.textBl,
              ),
              getVerticalSpace(1.4.h),
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
              getVerticalSpace(1.4.h),
              Divider(
                color: MyColor.greyColor,
              ),
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
              getVerticalSpace(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 1.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColor.redColor3,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Text('Cancel', style: Constant.textCancel),
                    ),
                  ),
                  getHorizontalSpace(2.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 1.1.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColor.orangeColor,
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Text(
                      'Delivered',
                      style: Constant.textCancel,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5.h)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.5.h)),
            padding: EdgeInsets.all(
              25.px,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(alignment: Alignment.centerRight,
                    child: GestureDetector(onTap: () {
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.cancel_rounded,color: MyColor.redColor3,))),
                getVerticalSpace(1.h),
                Text('Do you really want to cancel the order?',
                    style: Constant.textRed1),
                getVerticalSpace(1.h),
                Text(
                  ' (This will result in a fine, temporary suspension from the \napp, or a downgrade in your profile rating.)',
                  style: Constant.textBl,
                  textAlign: TextAlign.center,
                ),
                getVerticalSpace(3.h),
                GestureDetector(
                  onTap: () {
                    showAlertDialog1(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.px),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColor.orangeColor,
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Text(
                      'Continue',
                      style: Constant.textCancel,
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 8.px),
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //             color: MyColor.redColor3,
                //             borderRadius: BorderRadius.circular(2.h),
                //           ),
                //           child: Text('Cancel', style: Constant.textCancel),
                //         ),
                //       ),
                //     ),
                //
                //     getHorizontalSpace(1.h),
                //     // Replaced custom method with SizedBox for simplicity
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           showAlertDialog1(context);
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 8.px),
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //             color: MyColor.orangeColor,
                //             borderRadius: BorderRadius.circular(2.h),
                //           ),
                //           child: Text(
                //             'Continue',
                //             style: Constant.textCancel,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
  void showAlertDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5.h)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.5.h)),
            padding: EdgeInsets.all(
              30.px,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reason',
                    style: Constant.textB),
                getVerticalSpace(1.h),
                const CustomDescriptionTextfield(hintText: "Write reason...",),
                getVerticalSpace(1.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.px),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColor.orangeColor,
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Text(
                      'Send',
                      style: Constant.textCancel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
