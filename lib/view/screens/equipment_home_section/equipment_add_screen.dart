import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/custom_add_category_button.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_category.dart';
import 'package:opeec/view/screens/equipment_home_section/show_equipment_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widgets/custom_description_textfield.dart';
import '../../custom_widgets/equipment_custom_field.dart';
class EquipmentAddScreen extends StatefulWidget {
  const EquipmentAddScreen({super.key});

  @override
  State<EquipmentAddScreen> createState() => _EquipmentAddScreenState();
}

class _EquipmentAddScreenState extends State<EquipmentAddScreen> {
  RxInt selectedIndex = 0.obs; // -1 indicates no selection

  void _onRadioButtonTap(int index) {
    selectedIndex.value = index;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
              child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
          Text("Add Equipment",style: Constant.textAddOrange1,),
          SizedBox(height: 10,width: 10,)
        ],
      ),),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
               height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,border: Border.all(color: MyColor.blackColor2.withOpacity(.1)), // Ensure this color contrasts well with the child content
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
                  children: [
                    SvgPicture.asset(
                      "assets/svg/galleryImage.svg",
                    ),
                    getVerticalSpace(1.h), // Space between the image and the text
                    Text(
                      "Add Image",
                      style:Constant.textAddBlack1
                    ),
                  ],
                ),
              ),
            ),
            getVerticalSpace(2.h),
            Text("Basic Info",style: Constant.textNameBlack6,),
              getVerticalSpace(1.h),
            Text("Equipment Name",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
            const EquipmentCustomField(),
              getVerticalSpace(2.h),
              Text("Equipment Make",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const EquipmentCustomField(),
              getVerticalSpace(2.h),
              Text("Equipment Model",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const EquipmentCustomField(),
              getVerticalSpace(2.h),
              Text("Category",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
         CustomAddCategoryButton(width: 130.px,
             text: "Add Category", onPressed: (){
           Get.to(()=>const EquipmentCategory());
             }),
              getVerticalSpace(2.h),
              Text("Description ",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const CustomDescriptionTextfield(),
              getVerticalSpace(2.h),
              Text("Address",style: Constant.textNameBlack6,),
              getVerticalSpace(1.h),
              Text("Location",style: Constant.textAddBlack6,),
              getVerticalSpace(.8.h),
              const EquipmentCustomField(),
              getVerticalSpace(2.h),
              Text("Pickup and Delivery",style: Constant.textNameBlack6,),
              getVerticalSpace(2.h),
             Obx(() =>  Row(
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
                         color: selectedIndex.value == 0 ?MyColor.orangeColor1 : Colors.grey,
                         width: 2,
                       ),
                     ),
                     child: selectedIndex.value == 0
                         ? Center(
                       child: Container(
                         width: 10,
                         height: 10,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: MyColor.orangeColor1
                         ),
                       ),
                     )
                         : null,
                   ),
                 ),
                 SizedBox(width: 8), // Space between radio button and text
                 Expanded(
                   child: Text(
                     'Renter Pickup/Return',
                     style: Constant.textAddBlack6
                   ),
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
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color:MyColor.orangeColor1
                         ),
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
             ),),
              getVerticalSpace(2.h),
              Text("Pricing",style: Constant.textNameBlack6,),
              getVerticalSpace(1.3.h),
              Padding(
                padding:  EdgeInsets.only(right: 18.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                        child: EquipmentCustomField()),
                    getHorizontalSpace(2.w),
                    Text("Per Day",style: Constant.textAddBlack6,)
                  ],
                ),
              ),
              getVerticalSpace(2.h),
              Text("Equipment Price",style: Constant.textNameBlack6,),
              getVerticalSpace(1.h),
              Padding(
                padding:  EdgeInsets.only(right: 14.h),
                child: const EquipmentCustomField(),
              ),
              getVerticalSpace(5.h),
              Center(
                child: CustomElevatedButton(width: 160.px,
                    text: "Submit", onPressed: (){
                  Get.to(()=>const ShowEquipmentName());
                    }),
              ),
              getVerticalSpace(2.h),getHorizontalSpace(2.h)
          ],),
        ),
      ),
    );
  }
}
