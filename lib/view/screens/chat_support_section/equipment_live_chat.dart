import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/rental_home_section/add_rental_checkout_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';
class EquipmentLiveChatScreen extends StatefulWidget {
  const EquipmentLiveChatScreen({super.key, this.title, this.imagePath});
  final String? title;
  final String? imagePath;

  @override
  State<EquipmentLiveChatScreen> createState() => _EquipmentLiveChatScreenState();
}

class _EquipmentLiveChatScreenState extends State<EquipmentLiveChatScreen> {
  @override
  Widget build(BuildContext context) {
    RxList<String> chatList = <String>[].obs;
    RxInt selectedIndex = 0.obs;

    RxString messageLength = ''.obs;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(backgroundColor: Colors.white,
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
            Expanded(
              child: Column(
                children: [
                  getVerticalSpace(3.h),
                  GestureDetector(onTap: () {
                    // Get.to(()=>const AddRentalCheckOutScreen());
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
                  getVerticalSpace(3.8.h),
                  Text(
                    '12:10AM',style: Constant.textTime,
                  ),
                  Obx(
                        () => ListView.builder(
                      itemCount: chatList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Row(
                              children: [
                                // CircleAvatar(
                                //   radius: 2.5.h,
                                //   backgroundImage: AssetImage(widget.imagePath!),
                                // ),
                                // getHorizontalSpace(1.5.h),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(1.h),
                                  decoration: BoxDecoration(
                                    color: MyColor.orangeColor1,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.px),
                                      bottomRight: Radius.circular(10.px),
                                      topRight: Radius.circular(10.px),
                                    ),
                                  ),
                                  child: Text(
                                    chatList[index],
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.px,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [

                            Expanded(
                              child: TextFormField(
                                controller: chatController,
                                onChanged: (value) {
                                  messageLength.value = value;
                                },
                                autocorrect: false,
                                enableSuggestions: false,
                                cursorColor: MyColor.orangeColor1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  fillColor: const Color(0xffF8F8F8),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.h),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.h),
                                    borderSide: const BorderSide(color: MyColor.greyColor5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.h),
                                    borderSide: const BorderSide(color:MyColor.orangeColor1),
                                  ),
                                  isCollapsed: true,
                                  contentPadding:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 8.px),
                                  hintText: 'Type your message',
                                  hintStyle: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.blackColor12
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      getHorizontalSpace(1.h),
                      GestureDetector(
                        onTap: () {
                          if (chatController.text.isNotEmpty) {
                            chatList.add(chatController.text);
                            chatController.clear();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
                          decoration: BoxDecoration(
                            color: MyColor.orangeColor2,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(24.px),
                              right: Radius.circular(24.px),
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/shareIcon.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(2.2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
