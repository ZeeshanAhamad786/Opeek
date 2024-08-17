import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opeec/view/map_section/map_view_screen.dart';
import 'package:opeec/view/screens/equipment_home_section/show_equipment_name_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/range_controller.dart';
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
  RxInt selectedIndex = 0.obs; // -1 indicates no selection
  List<String> images = [
    "assets/png/audio.png",
    "assets/png/automative.png",
    "assets/png/farming.png",
    "assets/png/construction.png",
    "assets/png/power.png",
  ];
  List<String> profileNames = [
    "Audio",
    "Automotive",
    "Farming",
    "Construction",
    "Power",
  ];
  void _onRadioButtonTap(int index) {
    selectedIndex.value = index;
  }
  final CalendarController calendarController = Get.put(CalendarController());
  final RangeController rangeController = Get.put(RangeController());
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
                    GestureDetector(onTap: () {
                      showPaymentBottomSheet(context);
                    },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: MyColor.greyColor2, borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset("assets/svg/step.svg"),
                      ),
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
  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();
  final FocusNode cardHolderNameFocus = FocusNode();
  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                    "Filter",
                    style: Constant.textSearchOrange2,
                  )),
              getVerticalSpace(2.h),
              Text(
                "Pickup and Delivery",
                style: Constant.textBlack6,
              ),
              getVerticalSpace(1.4.h),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _onRadioButtonTap(0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: selectedIndex.value == 0 ? MyColor.orangeColor1 : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: selectedIndex.value == 0
                          ? Center(
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: MyColor.orangeColor1,
                        ),
                      )
                          : null,
                    ),
                  ),
                  SizedBox(width: 8), // Space between radio button and text
                  Expanded(
                    child: Text(
                      'Renter Pickup/Return',
                      style: Constant.textAddBlack6,
                    ),
                  ),
                  SizedBox(width: 16), // Space between radio buttons
                  GestureDetector(
                    onTap: () => _onRadioButtonTap(1),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          color: selectedIndex.value == 1 ? MyColor.orangeColor1 : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: selectedIndex.value == 1
                          ? Center(
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: MyColor.orangeColor1,
                        ),
                      )
                          : null,
                    ),
                  ),
                  SizedBox(width: 8), // Space between radio button and text
                  Expanded(
                    child: Text(
                      'Owner Pickup/Return',
                      style: Constant.textAddBlack6,
                    ),
                  ),
                ],
              )),
              getVerticalSpace(1.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories ",
                    style: Constant.textEmailBlack,
                  ),
                  Text(
                    "Sell all ",
                    style: Constant.textSeeAllOrange1,
                  ),
                ],
              ),
              getVerticalSpace(1.h),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Your onTap code here
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                images[index],
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.height / 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                            getVerticalSpace(0.5.h),
                            Expanded(child: Text(profileNames[index], style: Constant.textAudioBlack)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              getVerticalSpace(1.5.h),
              Text(
                "Select Date",
                style: Constant.textBlack1,
              ),
              Obx(() => ElevatedButton(
                onPressed: () {
                  calendarController.selectDate(context);
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
                      DateFormat('yyyy-MM-dd').format(calendarController.selectedDate.value),
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
              getVerticalSpace(1.5.h),
              Text(
                "Select Range",
                style: Constant.textBlack1,
              ),
              getVerticalSpace(.8.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Radius From: ",
                      style: TextStyle(
                        color: MyColor.blackColor, // Main text color
                        fontWeight: FontWeight.w400, // Make the text bold
                        fontSize: 16.px, // Set the font size
                      ),
                    ),
                    TextSpan(
                      text: "San Francisco, California, USA.",
                      style: TextStyle(
                        color: MyColor.orangeColor1, // Highlighted text color
                        fontWeight: FontWeight.w400, // Make the text bold
                        fontSize: 16.px, // Set the font size
                      ),
                    ),
                  ],
                ),
              ),

              getVerticalSpace(1.h),
              Obx(() => Column(
                children: [
                  Slider(
                    min: 0,
                    max: 20,
                    divisions: 20,
                    activeColor: MyColor.orangeColor1,
                    inactiveColor: Colors.grey,
                    value: rangeController.currentDistance.value,
                    onChanged: (double value) {
                      rangeController.updateDistance(value);
                    },
                  ),
                  getVerticalSpace(.2.h),
                  Text(
                    '${rangeController.currentDistance.value.toStringAsFixed(0)} km',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              )),
              getVerticalSpace(3.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your deposit logic here
                  },
                  child: Text(
                    'Apply Filter',
                    style: Constant.textCancel,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.orangeColor2,
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 15.w,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: MyColor.orangeColor2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(1.h),
              getHorizontalSpace(1.h)
            ],
          ),
        );
      },
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
