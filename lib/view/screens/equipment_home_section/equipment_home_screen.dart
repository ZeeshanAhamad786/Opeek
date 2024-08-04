import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/add_equipment_details/equipment_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/stepper_controller.dart';
import '../../custom_widgets/sized_widget.dart';
import 'equipment_active_screen.dart';
import 'equipment_active_screen_placeholder.dart';
import 'equipment_booked_screen.dart';

class EquipmentHomeScreen extends StatefulWidget {
  final int initialIndex;
  final bool showButton;

  const EquipmentHomeScreen({
    super.key,
    this.initialIndex = 0,
    this.showButton = false,
  });

  @override
  State<EquipmentHomeScreen> createState() => _EquipmentHomeScreenState();
}

class _EquipmentHomeScreenState extends State<EquipmentHomeScreen> {
  final StepperController stepperController = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Equipment", style: Constant.textSearchOrange1),
                if (widget.showButton) // Show button based on `showButton`
                  ElevatedButton(
                    onPressed: () {
                    Get.to(()=>  EquipmentDetails());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: MyColor.orangeColor1,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getHorizontalSpace(2.w),
                        Container(
                          height: 25.px,
                          width: 25.px,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.px),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 16.px,
                          ),
                        ),
                        SizedBox(width: 8.px),
                        Text(
                          "Add Equipment",
                          style: Constant.textCancel,
                        ),
                        getHorizontalSpace(2.w),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Text(
              "Effortlessly organize your Equipment",
              style: Constant.textPerfectBlack6,
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    color: MyColor.greyColor3,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 2.h),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: MyColor.orangeColor1,
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: Constant.textForgotOrange,
                      unselectedLabelColor: MyColor.greyColor1,
                      tabs: [
                        Tab(text: "Active"),
                        Tab(text: "Booked"),
                        Tab(text: "History"),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: TabBarView(
                      children: [
                        stepperController.isSubmitted.value
                            ? const EquipmentActiveScreen()
                            : const EquipmentActiveScreenPlaceholder(),
                        const EquipmentBookedScreen(),
                        const EquipmentActiveScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
