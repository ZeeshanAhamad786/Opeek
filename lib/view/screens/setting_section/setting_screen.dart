import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(children: [
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
                  "Setting",
                  style: Constant.textProfile,
                ),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            getVerticalSpace(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("5.0", style: Constant.text5),
                SizedBox(width: 0.5.h),
                RatingBar(
                  filledIcon: Icons.star,
                  filledColor: MyColor.orangeColor1,
                  size: 18,
                  emptyIcon: Icons.star_border,
                  onRatingChanged: (value) => debugPrint('$value'),
                  initialRating: 5,
                  maxRating: 5,
                ),
              ],
            ),
          ],),
        ),
      ),
    );
  }
}
