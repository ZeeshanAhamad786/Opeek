import 'package:flutter/material.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
class RentedNoneEquipmentScreen extends StatelessWidget {
  const RentedNoneEquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [getVerticalSpace(18.h),
            Center(child: Image.asset("assets/png/equipmentRented.png",
              width: 220.px,height: 200.px,)),
            getVerticalSpace(2.h),
            Text("None Equipment Rented",style: Constant.textNameBlack6,),
            getVerticalSpace(1.h),
            Text("Find the ideal equipment to suit your needs",style: Constant.textNameBlack9,),

          ],),
      ),
    );
  }
}
