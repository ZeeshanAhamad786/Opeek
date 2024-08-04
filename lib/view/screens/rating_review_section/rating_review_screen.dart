import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
class RatingReviewScreen extends StatefulWidget {
  const RatingReviewScreen({super.key});

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  List<String> data=[
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
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
                  "Ratings & Reviews",
                  style: Constant.textProfile,
                ),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            getVerticalSpace(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Mohsin", style: Constant.text5),
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
            getVerticalSpace(5.h),
            ListView.builder(
              itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(width: 0.5.h),
                      Text("Mohsin", style: Constant.textName1),
                    ],
                  ),
                  getVerticalSpace(1.h),
                  Text(data[index],style: Constant.textWithBlack,),
                  getVerticalSpace(1.3.h),
                  const Divider(color: MyColor.greyColor,)
                ],
              );

            })

          ],),
        ),
      ),
    );
  }
}
