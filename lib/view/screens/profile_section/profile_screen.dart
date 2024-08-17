import 'dart:io';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/centered_custom_textfield.dart';
import '../chat_support_section/chat_support_start.dart';
import '../rating_review_section/rating_review_screen.dart';
import '../setting_section/setting_screen.dart';
import '../wallet_section/my_wallet_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> names = ["My Wallet", "Rating & Reviews", "Settings", "Privacy Policy", "Chat Support", "Log out"];
  final List<String> imagePaths = [
    "assets/svg/walletIcon.svg",
    "assets/svg/ratingIcon.svg",
    "assets/svg/setting.svg",
    "assets/svg/privacyIcon.svg",
    "assets/svg/chatSupport.svg",
    "assets/svg/logout.svg"
  ];
  final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());

  // Define a method to handle navigation
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("My Profile",style: Constant.textProfile,),
                SizedBox(height: 10.px, width: 10.px),
              ],
            ),
          getVerticalSpace(2.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.2.h),
              decoration: const BoxDecoration(color: MyColor.greyColor3),
              child: Column(
                children: [
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xff007AFF)),
                      ),
                      child: Text("Edit", style: Constant.textBlue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(onTap: () {
                    navigateToScreen(index);
                  },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: const BoxDecoration(color: MyColor.greyColor3),
                        child: Row(
                          children: [
                            SvgPicture.asset(imagePaths[index]),
                            SizedBox(width: 2.w),
                            Text(names[index],style: Constant.textOpiBlack,), // Use the name from the list
                            Expanded(child: SizedBox()),
                             Icon(Icons.arrow_forward_ios_outlined,color: MyColor.orangeColor1,size: 18.px,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
  }

