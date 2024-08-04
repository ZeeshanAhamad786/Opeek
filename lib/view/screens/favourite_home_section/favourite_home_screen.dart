import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/map_section/map_view_screen.dart';
import 'package:opeec/view/screens/equipment_home_section/show_equipment_name_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/favourite_model.dart';
import '../../custom_widgets/search_customtextfield_screen.dart';
import '../../custom_widgets/sized_widget.dart';

class FavouriteHomeScreen extends StatefulWidget {
  const FavouriteHomeScreen({super.key});

  @override
  State<FavouriteHomeScreen> createState() => _FavouriteHomeScreenState();
}

class _FavouriteHomeScreenState extends State<FavouriteHomeScreen> {
  List<FavouriteModel> data = [
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/kitSmall.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
    FavouriteModel(category: 'Construction', imageUrl: 'assets/png/deliveryGlavz.png', name: 'Rotary Tool', time: '\$54/day', location: 'Kent, Utah'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerticalSpace(8.h),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios_new)),
                    getHorizontalSpace(2.w),
                    Expanded(
                      child: SearchCustomTextFormField(
                        hintText: 'Search equipment',
                        prefixIcon: SvgPicture.asset("assets/svg/searchOrange.svg"),
                      ),
                    ),
                    getHorizontalSpace(1.5.h),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: MyColor.greyColor2, borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset("assets/svg/step.svg"),
                    )
                  ],
                ),
                getVerticalSpace(3.h),
                Text("29 Equipment", style: Constant.textSeeAllOrange1),
                getVerticalSpace(1.5.h),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ShowEquipmentNameProfile());
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Adjust as needed
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.3, // 80% of the screen width
                // height: 60, // Adjust height as needed
                child: FloatingActionButton.extended(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    Get.to(() => const MapViewScreen());
                  },
                  backgroundColor: MyColor.orangeColor1,
                  icon: SvgPicture.asset("assets/svg/mapView.svg"),
                  label: Text("Map view", style: Constant.textWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//PREVOIUS CODE
// Text("Favorites",style: Constant.textSearchOrange1,),
// Text("Quickly access and manage your favorite equipments",style: Constant.textPerfectBlack6,),
// Expanded(
//   child: GridView.builder(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2, // Number of columns
//       crossAxisSpacing: 1.w, // Space between columns
//       mainAxisSpacing: 2.h, // Space between rows
//       childAspectRatio: 0.7, // Adjust if necessary
//     ),
//     itemCount: data.length,
//     itemBuilder: (context, index) {
//       final item = data[index];
//       return Padding(
//         padding: EdgeInsets.all(2.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   item.imageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             Text(
//               item.construction,
//               style:Constant.textConstructionBlack5,
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//             ),
//             SizedBox(height: 0.3.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     item.name,
//                     style:Constant.textNameBlack7,
//                     textAlign: TextAlign.left,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Text(
//                   item.dollar,
//                   style: Constant.textSeeAllOrange1,
//                   textAlign: TextAlign.left,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//             SizedBox(height: 0.5.h),
//             Row(
//               children: [
//                 RatingBar(
//                   filledIcon: Icons.star,
//                   filledColor:  MyColor.orangeColor1,
//                   size: 10,
//                   emptyIcon: Icons.star_border,
//                   onRatingChanged: (value) => debugPrint('$value'),
//                   initialRating: 5,
//                   maxRating: 5,
//                 ),
//                 SizedBox(width: 0.5.h),
//                 Expanded(
//                     child: Text("5.0",style: Constant.textNameBlack8,))
//               ],
//             ),
//             getVerticalSpace(.5.h),
//             Row(
//               children: [
//                 SvgPicture.asset("assets/svg/location.svg"),
//                 getHorizontalSpace(.5.w),
//                 Expanded(
//                   child: Text(
//                     item.location,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       color: Colors.grey,
//                     ),
//                     textAlign: TextAlign.left,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// ),
