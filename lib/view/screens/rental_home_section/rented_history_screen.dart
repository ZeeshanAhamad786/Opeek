import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';
import '../rental_home_section/rental_checkout_screen.dart';

class RentedHistoryScreen extends StatefulWidget {
  const RentedHistoryScreen({super.key});

  @override
  State<RentedHistoryScreen> createState() => _RentedHistoryScreenState();
}

class _RentedHistoryScreenState extends State<RentedHistoryScreen> {
  // Dummy data for the list
  final List<Map<String, dynamic>> rentedItems = [
    {
      "image": "assets/png/deliveryGlavz.png",
      "category": "Construction",
      "itemName": "Rotary Tool",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      "daysLeft": "11July"
    },
    // Add more items here as needed
    {
      "image": "assets/png/deliveryGlavz.png",
      "category": "Construction",
      "itemName": "Drill",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      "daysLeft": "11July"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const RentalCheckOutScreen());
          },
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
                            Text(item["itemName"],
                                style: Constant.textBlackColor),
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
                            Row(
                              children: [
                                RatingBar(
                                  filledIcon: Icons.star,
                                  filledColor: MyColor.orangeColor1,
                                  size: 12,
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
