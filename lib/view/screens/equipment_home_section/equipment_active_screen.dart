import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/equipment_home_section/show_equipment_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/stepper_controller.dart';
import '../../../model/favourite_model.dart';
import 'equipment_active_screen_placeholder.dart';

class EquipmentActiveScreen extends StatelessWidget {
  const EquipmentActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FavouriteModel> data = [
      FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
      FavouriteModel(category: 'Construction', imageUrl: 'assets/png/kitSmall.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
      FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Get.find<StepperController>().isSubmitted.value
                  ? Expanded(
                child: GestureDetector(onTap:() {
                  Get.to(()=>const ShowEquipmentName());
                },
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Container(
                          padding: EdgeInsets.only(right: 2.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: MyColor.greyColor1.withOpacity(0.1),
                            ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                data[index].imageUrl,
                                height: 100.px,
                                width: 120.px,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 2.h),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.h),
                                    Text(data[index].category, style: Constant.textBlackColor5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data[index].name, style: Constant.textBlackColor),
                                        Text(data[index].time, style: Constant.textForgotOrange),
                                      ],
                                    ),
                                    SizedBox(height: 1.5.h),
                                    Row(
                                      children: [
                                        RatingBar(
                                          filledIcon: Icons.star,
                                          filledColor: MyColor.orangeColor1,
                                          size: 12,
                                          emptyIcon: Icons.star_border,
                                          onRatingChanged: (value) => debugPrint('$value'),
                                          initialRating: 5,
                                          maxRating: 5,
                                        ),
                                        SizedBox(width: 1.h),
                                        Text("5.0", style: Constant.textNameBlack8),
                                      ],
                                    ),
                                    SizedBox(height: 0.2.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset("assets/svg/location.svg"),
                                        SizedBox(width: 0.5.w),
                                        Expanded(
                                          child: Text(
                                            data[index].location,
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
                      );
                    },
                  ),
                ),
              )
                  : const EquipmentActiveScreenPlaceholder();
            }),
          ],
        ),
      ),
    );
  }
}
