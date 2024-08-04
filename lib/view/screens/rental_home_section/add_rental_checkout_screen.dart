import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:opeec/view/screens/rental_home_section/rental_checkout_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/security_fee_controller.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/equipment_custom_field.dart';
import '../../custom_widgets/sized_widget.dart';
class AddRentalCheckOutScreen extends StatefulWidget {
  const AddRentalCheckOutScreen({super.key});

  @override
  State<AddRentalCheckOutScreen> createState() => _AddRentalCheckOutScreenState();
}

class _AddRentalCheckOutScreenState extends State<AddRentalCheckOutScreen> {
  final CalendarController calendarController = Get.put(CalendarController());
  final CalendarController1 calendarController1 = Get.put(CalendarController1());
  final CustomController customController = Get.put(CustomController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                Text(
                  "Rental Checkout",
                  style: Constant.textProfile,
                ),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            getVerticalSpace(3.h),
            GestureDetector(onTap: () {
              Get.to(()=>const AddRentalCheckOutScreen());
            },
              child: Container(
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
            ),
            getVerticalSpace(2.h),
            Row(mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/png/profileImage.png"),
                  radius: 18,
                ),
                getHorizontalSpace(2.w),
                Text("Mohsin Shop",style: Constant.textAccountBlack1,),
              ],
            ),
              getVerticalSpace(2.h),
              Text("Rental Schedule",style: Constant.textName3,),
              getVerticalSpace(2.h),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [
                  Text("Start Date"),
                  getHorizontalSpace(.2.w),
                  Text("End Date"),
                  getVerticalSpace(15),getHorizontalSpace(15),
                ],
              ),
              Obx(() => Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calendarController1.selectStartDate(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/calendar.svg",
                          color: MyColor.orangeColor1,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          DateFormat('yyyy-MM-dd').format(calendarController1.selectedStartDate.value),
                          style: Constant.textLoginOrange1,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: MyColor.orangeColor1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  getHorizontalSpace(2.w),
                  const Text("To",),
                  getHorizontalSpace(2.w),
          
                  Obx(() => ElevatedButton(
                    onPressed: () {
                      calendarController1.selectEndDate(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/calendar.svg",
                          color: MyColor.orangeColor1,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          DateFormat('yyyy-MM-dd').format(calendarController1.selectedEndDate.value),
                          style: Constant.textLoginOrange1,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: MyColor.orangeColor1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                ],
              )),
              getVerticalSpace(2.h),
              Text("Delivery Address",style: Constant.textNameBlack6,),
              getVerticalSpace(1.h),
              Text("Location",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const EquipmentCustomField(),
              getVerticalSpace(2.h),
              Text("Security Fee",style: Constant.textNameBlack6,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Obx(() => buildContainer(
                        index: 0,
                        isSelected: customController.selectedContainer.value == 0,
                        onTap: () => customController.selectContainer(0),
                        title: "\$ 5 Dollar",
                        status: "Insurance",
                        description: "Nonrefundable\n7% of tool price",
                      )),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Obx(() => buildContainer(
                        index: 1,
                        isSelected: customController.selectedContainer.value == 1,
                        onTap: () => customController.selectContainer(1),
                        title: "\$ 10 Dollar",
                        status: "Protection money",
                        description: "Nonrefundable\n10% of tool price",
                      )),
                    ),
                  ],
                ),
              ),
              getVerticalSpace(5.h),
              Center(
                child: CustomElevatedButton(width: 220.px,
                  text: 'Next', onPressed: () {
                  Get.to(()=>const RentalCheckOutScreen());
                  },),
              ),
              getVerticalSpace(2.h),getHorizontalSpace(2.h)
            ],),
        ),
      ),
    );
  }
  Widget buildContainer({
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
    required String title,
    required String status,
    required String description,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Constant.textResetOrange1,
            ),
            getVerticalSpace(1.h),
            Text(
              status,
              style:Constant.textBlackColor
            ),
            getVerticalSpace(1.h),
            Text(
              description,
              style:Constant.textBl
            ),
            getVerticalSpace(1.h),
            Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: isSelected ? Colors.orange : Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


