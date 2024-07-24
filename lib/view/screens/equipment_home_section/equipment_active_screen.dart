import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_add_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
class EquipmentActiveScreen extends StatelessWidget {
  const EquipmentActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [getVerticalSpace(16.h),
        Center(child: Image.asset("assets/png/equipmentNone.png",width: 220.px,height: 190.px,)),
            getVerticalSpace(1.5.h),
            Text("None Equipment currently",style: Constant.textNameBlack6,),
            getVerticalSpace(1.h),
            Text("List your equipment and start earning today!",style: Constant.textNameBlack9,),
            getVerticalSpace(2.h),
            CustomElevatedButton(width: 160.px,
                text: "Add Equipment", onPressed: (){
                  Get.to(()=>const EquipmentAddScreen());
                })
        ],),
      ),
    );
  }
}
