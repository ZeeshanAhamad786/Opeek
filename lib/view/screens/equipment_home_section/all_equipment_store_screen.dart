import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/chat_support_section/equipment_live_chat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/favourite_model.dart';
import '../../custom_widgets/sized_widget.dart';

class AllEquipmentStoreScreen extends StatefulWidget {
  const AllEquipmentStoreScreen({super.key});

  @override
  State<AllEquipmentStoreScreen> createState() => _AllEquipmentStoreScreenState();
}

class _AllEquipmentStoreScreenState extends State<AllEquipmentStoreScreen> {
  List<FavouriteModel> data = [
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/kitSmall.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
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
                  "Mohsin Shop",
                  style: Constant.textProfile,
                ),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
            getVerticalSpace(2.h),
            CircleAvatar(
              backgroundImage: AssetImage("assets/png/profileImage.png"),
              radius: 40,
            ),
            getVerticalSpace(1.h),
            Text(
              "Mohsin",
              style: Constant.textName,
            ),
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
            getVerticalSpace(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("All Equipment in Store", style: Constant.textForgotOrange),
            ),
            getVerticalSpace(1.3.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const EquipmentLiveChatScreen());
                          },
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      getVerticalSpace(2.h),
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
                                          getHorizontalSpace(.5.w),
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
                        ),
                      ),
                      Divider(color: MyColor.greyColor,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
