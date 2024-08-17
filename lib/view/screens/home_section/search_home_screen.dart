
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/favourite_home_section/favourite_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/global_key.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../../controller/utils/range_controller.dart';
import '../../../model/construction_model.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/equipment_custom_field.dart';
import '../../custom_widgets/search_customtextfield_screen.dart';
class SearchHomeScreen extends StatefulWidget {
  const SearchHomeScreen({Key? key}) : super(key: key);

  @override
  State<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {
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


  List<ConstructionModel> data = [
    ConstructionModel(
        imageUrl: 'assets/png/drill.png', name: 'Rotary Tool', construction: 'construction', dollar: '\$54/day', location: 'Kent, Utah'),
    ConstructionModel(
        imageUrl: 'assets/png/glawz.png', name: 'Corona, Michigan', construction: 'construction', dollar: '\$54/day', location: 'Corona, Michigan'),
    ConstructionModel(
        imageUrl: 'assets/png/kit.png', name: 'Biscuit Joiner', construction: 'construction', dollar: '\$54/day', location: 'Portland, Illinois'),
    ConstructionModel(
        imageUrl: 'assets/png/parashoot.png',
        name: 'Belt Sander',
        construction: 'construction',
        dollar: '\$54/day',
        location: 'Stockton, New Hampshire'),
  ];
  final List<String>slideImages=[
    "assets/png/drillEquipment.png",
    "assets/png/plusEquipment.png",
    "assets/png/hammer.png",
    "assets/png/equipmentBox.png",
    "assets/png/fastDrillEquipment.png",
    "assets/png/drillEquipment.png",
    "assets/png/fastDrillEquipment.png",
    "assets/png/equipmentBox.png",
    "assets/png/equipmentBox.png",
    "assets/png/equipmentBox.png",

  ];
  final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());

  RxInt selectedIndex = 0.obs; // -1 indicates no selection

  void _onRadioButtonTap(int index) {
    selectedIndex.value = index;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CalendarController calendarController = Get.put(CalendarController());
  final RangeController rangeController = Get.put(RangeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          getVerticalSpace(8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(onTap:(){
                  AppKeys.scaffoldKey.currentState?.openDrawer();
                },
                    child:Stack(
                      children: [
                        Obx(() => Container(
                          decoration:  BoxDecoration(borderRadius: BorderRadius.circular(30),
        border: Border.all( color:MyColor.orangeColor1,width: 2)),
                          child: CircleAvatar(
                            backgroundImage: imagePickerProfileController.imagePath.isNotEmpty
                                ? FileImage(File(imagePickerProfileController.imagePath.value))
                                : AssetImage("assets/png/profileImage.png") as ImageProvider,
                            radius: 16,
                          ),
                        )),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child:  Container(
                            decoration: BoxDecoration(
                              color: MyColor.orangeColor1,
                                borderRadius: BorderRadius.circular(30),border: Border.all
                              (color:Colors.white,width: 1)),
                            height: 18,width: 18,
                            child: Icon(Icons.menu_sharp,color: Colors.white,size: 14,),
                          )
                        ),
                      ],
                    ),

                ),
                getHorizontalSpace(4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search",
                        style: Constant.textSearchOrange1,
                      ),
                      Text(
                        "Find the perfect equipment with ease",
                        style: Constant.textPerfectBlack6,
                      ),
                    ],
                  ),
                ),
                // GestureDetector(onTap: () {
                //   Get.to(()=>const ProfileScreen());
                // },
                //     child: Image.asset("assets/png/profileIcon.png",height: 40,width: 40,))
              ],
            ),
          ),
          getVerticalSpace(1.5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                Expanded(
                  child: SearchCustomTextFormField(
                    hintText: 'Search equipment',
                    prefixIcon: SvgPicture.asset("assets/svg/searchOrange.svg"),
                  ),
                ),
                getHorizontalSpace(1.5.h),
                GestureDetector(
                  onTap: () {
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
          ),
          getVerticalSpace(2.h),
      Expanded(
        child: GestureDetector(onTap:  () {
          Get.to(()=>const FavouriteHomeScreen());

        },
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Horizontal spacing
              mainAxisSpacing: 15, // Vertical spacing
            ),
            itemCount: slideImages.length, // Number of items
            itemBuilder: (context, index) {
              return Image.asset(slideImages[index]);
            },
          ),
        ),
      ),



        getVerticalSpace(3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                Text(
                  "Endless Equipment Options",
                  style: Constant.blackColorN,
                ),
                getVerticalSpace(1.h),
                Text(
                  "Choose from hundreds of unique models you won't find anywhere else. Pick it up or have it delivered to your desired location.",
                  style: Constant.greyColor10,
                  textAlign: TextAlign.center,
                ),
                getVerticalSpace(2.h),
                CustomElevatedButton(
                  width: 170.px,
                  text: "Explore Equipment",
                  onPressed: () {
                    Get.to(()=>const FavouriteHomeScreen());
                  },
                ),
                getVerticalSpace(3.h),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Browse by categories",
                      style: Constant.textEmailBlack,
                    )),
                getVerticalSpace(1.3.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(()=>const FavouriteHomeScreen());
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
                              Expanded(
                                child: Text(profileNames[index], style: Constant.textAudioBlack),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          getVerticalSpace(3.h),
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
                        side: const BorderSide(color: MyColor.orangeColor1),
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
