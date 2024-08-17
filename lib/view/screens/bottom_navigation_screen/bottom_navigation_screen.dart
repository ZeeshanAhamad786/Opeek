import 'dart:io';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/home_section/search_home_screen.dart';
import 'package:opeec/view/screens/inbox_home_screen/inbox_home_screen.dart';
import 'package:opeec/view/screens/rental_home_section/rental_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/global_key.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/centered_custom_textfield.dart';
import '../../custom_widgets/sized_widget.dart';
import '../chat_support_section/chat_support_start.dart';
import '../equipment_home_section/equipment_home_screen.dart';
import '../favourite_home_section/favourite_home_screen.dart';
import '../rating_review_section/rating_review_screen.dart';
import '../setting_section/setting_screen.dart';
import '../wallet_section/my_wallet_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final RxInt currentIndex = 0.obs;
  final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());
  final List<String> names = ["My Wallet", "Rating & Reviews", "Settings", "Privacy Policy", "Chat Support",
    "Rate Us","Share", "Log out",
  ];
  final List<String> imagePaths = [
    "assets/svg/walletIcon.svg",
    "assets/svg/ratingIcon.svg",
    "assets/svg/setting.svg",
    "assets/svg/privacyIcon.svg",
    "assets/svg/chatSupport.svg",
    "assets/svg/star.svg",
    "assets/svg/share.svg",
    "assets/svg/logout.svg",
  ];
  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Get.to(() => const MyWalletScreen());
        break;
      case 1:
        Get.to(() => const RatingReviewScreen());
        break;
      case 2:
        Get.to(() => const SettingScreen());
        break;
      case 3:
      // Get.to(() => PrivacyPolicyScreen());
        break;
      case 4:
        Get.to(() => const ChatSupportStart());
        break;
      case 5:
      // Get.to(() => LogOutScreen());
        break;
      default:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(key:AppKeys.scaffoldKey,

      drawer: SafeArea(
        child: Drawer(width: MediaQuery.of(context).size.width*0.7,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(36))),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                decoration: const BoxDecoration( color:Color(0xffffe8dd) ,
                ),
                child: Column(children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 2.h),
                    child: Align(alignment:Alignment.centerRight,
                        child: GestureDetector(onTap: () {
                          Navigator.of(context).pop();
                        },
                            child: SvgPicture.asset("assets/svg/drawerClose.svg"))),
                  ),
                  getVerticalSpace(1.h),
                  Obx(() => CircleAvatar(
                    backgroundImage: imagePickerProfileController.imagePath.isNotEmpty
                        ? FileImage(File(imagePickerProfileController.imagePath.value))
                        : AssetImage("assets/png/profileImage.png") as ImageProvider,
                    radius: 40,
                  )),
                  getVerticalSpace(1.h),
                  Text("Mohsin",style: Constant.textName,),
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
                  getVerticalSpace(1.h),
                  GestureDetector(onTap: () {
                    showAlertDialog(context);
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                      decoration: BoxDecoration(color: MyColor.orangeColor1,
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/write.svg"),
                          getHorizontalSpace(1.w),
                          Text("Edit", style: Constant.textWhite),
                        ],
                      ),
                    ),
                  ),
                ],),
              ),
              getVerticalSpace(2.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: () {
                      navigateToScreen(index);
                    },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(imagePaths[index]),
                            SizedBox(width: 2.w),
                            Text(names[index],style: Constant.textOpiBlack,), // Use the name from the list

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],)),
      ),




      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: MyColor.orangeColor,
        unselectedItemColor: MyColor.blackColor5,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        onTap: (value) {
          // Update current index on item tap
          currentIndex.value = value;
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/search.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 0 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Search",
              isSelected: currentIndex.value == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/heart.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 1 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Favorites",
              isSelected: currentIndex.value == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/equipment.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 2 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Equipment",
              isSelected: currentIndex.value == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/inbox.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 3 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Inbox",
              isSelected: currentIndex.value == 3,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/rental.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 4 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Rentals",
              isSelected: currentIndex.value == 4,
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (currentIndex.value) {
          case 0:
            return const SearchHomeScreen();
          case 1:
            return const FavouriteHomeScreen();
          case 2:
            return const EquipmentHomeScreen(showButton: false,);
          case 3:
            return const InboxHomeScreen();
          case 4:
            return const RentalHomeScreen();
          default:
            return const SizedBox();
        }
      }),
    ));
  }
  void showAlertDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5.h)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.5.h)),
            padding: EdgeInsets.all(30.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    imagePickerProfileController.getImage();
                  },
                  child: Stack(
                    children: [
                      Obx(() => CircleAvatar(
                        backgroundImage: imagePickerProfileController.imagePath.isNotEmpty
                            ? FileImage(File(imagePickerProfileController.imagePath.value))
                            : AssetImage("assets/png/profileImage.png") as ImageProvider,
                        radius: 50,
                      )),
                      Positioned(
                        right: 2,
                        bottom: 3,
                        child: SvgPicture.asset("assets/svg/cameraIcon.svg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h), // Replaced custom method with SizedBox for simplicity
                CenteredTextFormField(
                  hintText: "Name",
                ),
                SizedBox(height: 5.h), // Replaced custom method with SizedBox for simplicity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: MyColor.blackColor.withOpacity(0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 8,
                                  spreadRadius: 0)
                            ],
                            color: MyColor.greyColor1,
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Text('Cancel', style: Constant.textCancel),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.h), // Replaced custom method with SizedBox for simplicity
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // showAlertDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MyColor.greenColor,
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Text(
                            'Save',
                            style: Constant.textCancel,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({required Widget icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected
            ? Container(
          height: 5.px,
          decoration: const BoxDecoration(color:  MyColor.orangeColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          width: 55.px,
          margin: EdgeInsets.only(bottom: 5.px), // Adjust this value if needed to ensure it aligns perfectly
        )
            : SizedBox(height: 10.px),
        icon,
        Text(
          label,
          style: TextStyle(
            color: isSelected ? MyColor.orangeColor : MyColor.blackColor5,
            fontSize: 12.px,
          ),
        ),
      ],
    );
  }
}
