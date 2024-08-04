import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/constant.dart';
import '../../controller/utils/custom_progress_indicator.dart';
import '../../controller/utils/image_picker_controller.dart';
import '../../controller/utils/my_color.dart';
import '../../controller/utils/stepper_controller.dart';
import '../../view/custom_widgets/custom_elevated_button.dart';
import '../../view/custom_widgets/custom_description_textfield.dart';
import '../../view/custom_widgets/equipment_custom_field.dart';
import '../../view/custom_widgets/sized_widget.dart';
import '../screens/equipment_home_section/equipment_active_screen.dart';
import '../screens/equipment_home_section/equipment_home_screen.dart';

class EquipmentDetails extends StatelessWidget {
  final StepperController stepperController = Get.put(StepperController());
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  // List of category names
  final List<String> categoryNames = [
    "Audio",
    "Automotive",
    "Farming",
    "Construction",
    "Power",
    "Outdoor",
  ];
  final List<String> categoryName1 = [
    "Audio Mic",
    "Speaker",
    "Headphone",
    "Construction",
    "Power",
    "Outdoor",
  ];
  var expandedItems = <int>[].obs;

  void toggleItem(int index) {
    if (expandedItems.contains(index)) {
      expandedItems.remove(index);
    } else {
      expandedItems.add(index);
    }
  }

  RxInt selectedIndex = 0.obs; // -1 indicates no selection

  void _onRadioButtonTap(int index) {
    selectedIndex.value = index;
  }

  RxString? chooseCommunity = RxString('');
  RxString? chooseCommunity1 = RxString('');
  RxString? chooseCommunity2 = RxString('');
  final List<String> community = ["3 hours (recommended)", "5 hours (recommended)",
    "2 hours (recommended)", "1 hours (recommended)"];
  final List<String> community1 = ["3 day (recommended)", "5 day (recommended)",
    "2 day (recommended)", "1 day (recommended)"];
  final List<String> community2 = ["3 month (recommended)", "5 month (recommended)",
    "2 month (recommended)", "1 month (recommended)"];

  EquipmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                stepperController.previousStep();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
            Text(
              "Add Equipment",
              style: Constant.textName, // Adjust this as needed
            ),
            SizedBox(
              height: 10.px,
              width: 10.px,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(3.h),
              Obx(() => CustomStepProgressIndicator(
                    totalSteps: 6,
                    currentStep: stepperController.currentStep.value,
                    selectedColor: MyColor.orangeColor1,
                    unselectedColor: Colors.grey,
                  )),
              getVerticalSpace(3.h),
              Obx(() {
                if (stepperController.currentStep.value == 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Equipment Details", style: Constant.textNameBlackNew)),
                      getVerticalSpace(5.h),
                      Text(
                        "Equipment Name",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(1.h),
                      const EquipmentCustomField(),
                      getVerticalSpace(2.h),
                      Text(
                        "Make",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(1.h),
                      const EquipmentCustomField(),
                      getVerticalSpace(2.h),
                      Text(
                        "Model",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(1.h),
                      const EquipmentCustomField(),
                      getVerticalSpace(2.h),
                      Text(
                        "Serial Number",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(1.h),
                      const EquipmentCustomField(),
                      getVerticalSpace(2.h),
                      Text(
                        "Description ",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(2.h),
                      const CustomDescriptionTextfield(),
                    ],
                  );
                } else if (stepperController.currentStep.value == 2) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Equipment Photos", style: Constant.textNameBlackNew)),
                      getVerticalSpace(3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/svg/light.svg"),
                          SvgPicture.asset("assets/svg/glasses.svg"),
                          SvgPicture.asset("assets/svg/camera.svg"),
                        ],
                      ),
                      getVerticalSpace(2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text("Take photos in good\nlighting.", style: Constant.textAccountBlack, textAlign: TextAlign.center),
                          ),
                          Flexible(
                            child: Text("Take clear photos.", style: Constant.textAccountBlack, textAlign: TextAlign.center),
                          ),
                          Flexible(
                            child: Text("Take photos from\nevery angle.", style: Constant.textAccountBlack, textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      getVerticalSpace(3.h),
                      Obx(() {
                        List<Widget> imageWidgets = imagePickerController.imagePaths.asMap().entries.map((entry) {
                          int index = entry.key;
                          String path = entry.value;
                          return Container(
                            margin: EdgeInsets.all(4.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.file(
                                  File(path),
                                  height: 100, // Adjust the height and width as needed
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      imagePickerController.removeImage(path);
                                    },
                                    child: Container(
                                      color: Colors.white, // Optional: Adds background color to the icon
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(Icons.cancel, color: MyColor.redColor3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList();

                        // Add the "Add Image" button only if there are fewer than 3 images
                        if (imagePickerController.imagePaths.length < 3) {
                          imageWidgets.insert(
                            0,
                            Container(
                              margin: EdgeInsets.all(4.0),
                              height: imagePickerController.imagePaths.isEmpty ? 150 : 100, // Adjust size dynamically
                              width: imagePickerController.imagePaths.isEmpty ? 150 : 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: MyColor.greyColor9),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerController.getImage();
                                },
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svg/galleryImage.svg",
                                        color: MyColor.orangeColor1,
                                      ),
                                      SizedBox(height: 8.0), // Space between the image and the text
                                      Text(
                                        "Add Image",
                                        style: Constant.textLoginOrange,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: 4.h,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: MyColor.greyColor9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Wrap(
                              spacing: 4.0, // Space between items
                              runSpacing: 4.0, // Space between rows
                              children: imageWidgets,
                            ),
                          ),
                        );
                      }),
                      getVerticalSpace(3.h),
                      Text(
                        "High-quality photos help you earn more by attracting more interest. Upload up to 3 photos, showing different angles and details of the equipment.",
                        style: Constant.textAccountBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else if (stepperController.currentStep.value == 3) {
                  return Column(
                    children: [
                      Center(child: Text("Equipment Category", style: Constant.textNameBlackNew)),
                      getVerticalSpace(5.h),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: categoryNames.length,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              bool isExpanded = expandedItems.contains(index);
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(categoryNames[index], style: Constant.textSearchOrange2),
                                    trailing: Icon(
                                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: isExpanded ? MyColor.orangeColor1 : Colors.black,
                                    ),
                                    onTap: () {
                                      toggleItem(index);
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                                    child: Divider(color: Colors.grey.withOpacity(.5)),
                                  ),
                                  if (isExpanded)
                                    Column(
                                      children: [
                                        ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: categoryName1.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    categoryName1[index],
                                                    style: Constant.textStartBlack,
                                                  ),
                                                  onTap: () {
                                                    // Handle tap here, if needed
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                                                  child: Divider(color: MyColor.greyColor.withOpacity(.5)),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            });
                          },
                        ),
                      )
                    ],
                  );
                } else if (stepperController.currentStep.value == 4) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Equipment Location", style: Constant.textNameBlackNew)),
                      getVerticalSpace(5.h),
                      Text(
                        "Address",
                        style: Constant.textNameBlack6,
                      ),
                      getVerticalSpace(1.2.h),
                      Text(
                        "Location",
                        style: Constant.textAddBlack6,
                      ),
                      getVerticalSpace(1.h),
                      const EquipmentCustomField(),
                      getVerticalSpace(2.h),
                      Text(
                        "Pickup and Delivery",
                        style: Constant.textNameBlack6,
                      ),
                      getVerticalSpace(2.h),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => _onRadioButtonTap(0),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedIndex.value == 0 ? MyColor.orangeColor1 : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: selectedIndex.value == 0
                                    ? Center(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: MyColor.orangeColor1),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(width: 8), // Space between radio button and text
                            Expanded(
                              child: Text('Renter Pickup/Return', style: Constant.textAddBlack6),
                            ),
                            SizedBox(width: 16), // Space between radio buttons
                            GestureDetector(
                              onTap: () => _onRadioButtonTap(1),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedIndex.value == 1 ? MyColor.orangeColor1 : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: selectedIndex.value == 1
                                    ? Center(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: MyColor.orangeColor1),
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
                        ),
                      ),
                    ],
                  );
                } else if (stepperController.currentStep.value == 5) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Equipment Pricing", style: Constant.textNameBlackNew)),
                      getVerticalSpace(5.h),
                      Text(
                        "Pricing",
                        style: Constant.textNameBlack6,
                      ),
                      getVerticalSpace(1.3.h),
                      Padding(
                        padding: EdgeInsets.only(right: 18.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(child: EquipmentCustomField()),
                            getHorizontalSpace(2.w),
                            Text(
                              "Per Day",
                              style: Constant.textAddBlack6,
                            )
                          ],
                        ),
                      ),
                      getVerticalSpace(2.h),
                      Text(
                        "Equipment Price",
                        style: Constant.textNameBlack6,
                      ),
                      getVerticalSpace(1.2.h),
                      const EquipmentCustomField(
                        hintText: "Maximum \$400",
                      ),
                    ],
                  );
                } else if (stepperController.currentStep.value == 6) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Equipment Availability", style: Constant.textNameBlackNew)),
                      getVerticalSpace(5.h),
                      Text(
                        "Advance notice",
                        style: Constant.textB,
                      ),
                      getVerticalSpace(1.h),
                      Text(
                        "How much advance notice do you need before a trip\n starts?",
                        style: Constant.textBlackColor,
                      ),
                      getVerticalSpace(1.2.h),
                      Text(
                        "(Most bookings are made with less than 12 hours' notice.)",
                        style: Constant.textAccountBlack2,
                      ),
                      getVerticalSpace(1.2.h),
                      Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                border: Border.all(color:MyColor.greyColor9),
                borderRadius: BorderRadius.circular(8),),
                        child: DropdownButtonHideUnderline(
                          child: Obx(() {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                chooseCommunity!.value.isEmpty ? 'Select Time' : chooseCommunity!.value,
                                style:Constant.textForgotOrange,
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: community.map((String communityName) {
                                return DropdownMenuItem<String>(
                                  value: communityName,
                                  child: Text(
                                    communityName,
                                    style:Constant.textForgotOrange,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                chooseCommunity!.value = value!;
                              },
                            );
                          }),
                        ),
                      ),
                      getVerticalSpace(1.2.h),
                      Text(
                        "Trip duration",
                        style: Constant.textB,
                      ),
                      getVerticalSpace(1.h),
                      Text(
                        "What's the shortest and longest possible trip you'll\n accept?",
                        style: Constant.textBlackColor,
                      ),
                      getVerticalSpace(1.h),
                      Text(
                        "Minimum trip duration",
                        style: Constant.textBlackColor,
                      ),
                      getVerticalSpace(1.h),
                      Text(
                        "(A 1-day minimum opens you up to all bookings!)",
                        style: Constant.textAccountBlack2,
                      ),
                      getVerticalSpace(1.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color:MyColor.greyColor9),
                          borderRadius: BorderRadius.circular(8),),
                        child: DropdownButtonHideUnderline(
                          child: Obx(() {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                chooseCommunity1!.value.isEmpty ? 'Select Day' : chooseCommunity1!.value,
                                style:Constant.textForgotOrange,
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: community1.map((String communityName) {
                                return DropdownMenuItem<String>(
                                  value: communityName,
                                  child: Text(
                                    communityName,
                                    style:Constant.textForgotOrange,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                chooseCommunity1!.value = value!;
                              },
                            );
                          }),
                        ),
                      ),
                      getVerticalSpace(2.h),
                      Text(
                        "Maximum trip duration",
                        style: Constant.textBlackColor,
                      ),
                      getVerticalSpace(1.h),
                      Text(
                        "(Few trips exceed your 1-month maximum.)     ",
                        style: Constant.textAccountBlack2,
                      ),
                      getVerticalSpace(1.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color:MyColor.greyColor9),
                          borderRadius: BorderRadius.circular(8),),
                        child: DropdownButtonHideUnderline(
                          child: Obx(() {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                chooseCommunity2!.value.isEmpty ? 'Select Month' : chooseCommunity2!.value,
                                style:Constant.textForgotOrange,
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: community2.map((String communityName) {
                                return DropdownMenuItem<String>(
                                  value: communityName,
                                  child: Text(
                                    communityName,
                                    style:Constant.textForgotOrange,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                chooseCommunity2!.value = value!;
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.h),
        child: Obx(() {
          return CustomElevatedButton(
            width: double.infinity,
            text: stepperController.isLastStep.value ? "Submit" : "Next",
            onPressed: () {
              if (stepperController.isLastStep.value) {
                stepperController.submit();
                // Navigate to EquipmentActiveScreen
                Get.to(() => const EquipmentHomeScreen(initialIndex: 0,showButton: true,));
              } else {
                stepperController.nextStep();
              }
            },
          );
        }),
      ),

    );
  }
}
