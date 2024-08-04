import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../add_equipment_details/equipment_details.dart';

class EquipmentActiveScreenPlaceholder extends StatelessWidget {
  const EquipmentActiveScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Center(
              child: Image.asset(
                "assets/png/equipmentNone.png",
                width: 220.px,
                height: 190.px,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "None Equipment currently",
              style: Constant.textNameBlack6,
            ),
            SizedBox(height: 1.h),
            Text(
              "List your equipment and start earning today!",
              style: Constant.textNameBlack9,
            ),
            SizedBox(height: 2.h),
            CustomElevatedButton(
              width: 160.px,
              text: "Add Equipment",
              onPressed: () {
                Get.to(() => EquipmentDetails());
              },
            ),
          ],
        ),
      ),
    );
  }
}
