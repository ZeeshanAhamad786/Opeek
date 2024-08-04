import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/screens/rental_home_section/rental_checkout_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';

class RentedScreen extends StatefulWidget {
  const RentedScreen({super.key});

  @override
  State<RentedScreen> createState() => _RentedScreenState();
}

class _RentedScreenState extends State<RentedScreen> {
  // Dummy data for the list
  final List<Map<String, dynamic>> rentedItems = [
    {
      "image": "assets/png/deliveryGlavz.png",
      "category": "Construction",
      "itemName": "Rotary Tool",
      "quantity": 5,
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      "daysLeft": "Day Left"
    },
    // Add more items here as needed
    {
      "image": "assets/png/deliveryGlavz.png",
      "category": "Construction",
      "itemName": "Drill",
      "quantity": 2,
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      "daysLeft": "Days Left"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: GestureDetector(onTap:(){
          Get.to(()=>const RentalCheckOutScreen());
        } ,
          child: ListView.builder(
            itemCount: rentedItems.length,
            itemBuilder: (context, index) {
              final item = rentedItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Container(
                  padding: EdgeInsets.only(right: 2.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: MyColor.greyColor1.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10),
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
                        item["image"],
                        height: 140.px,
                        width: 130.px,
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
                            getVerticalSpace(2.h),
                            Text(item["category"], style: Constant.textBlackColor5),
                            // Adjust text styles as needed
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item["itemName"],
                                      style: Constant.textBlackColor),
                                  Text(item["quantity"].toString(),
                                      style: Constant.textForgotOrange),
                                ],
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                      item["description"],
                                      style: Constant.textLight1,
                                    )),
                                SizedBox(width: 1.h),
                                // Adjust spacing for better layout
                                Text(item["daysLeft"],
                                    style: Constant.textForgotOrange),
                              ],
                            ),
                            getVerticalSpace(1.h),
                            getHorizontalSpace(1.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
