import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/constant.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/screens/equipment_home_section/equipment_audio.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EquipmentCategory extends StatefulWidget {
  const EquipmentCategory({Key? key}) : super(key: key);

  @override
  State<EquipmentCategory> createState() => _EquipmentCategoryState();
}

class _EquipmentCategoryState extends State<EquipmentCategory> {
  // List of category names
  final List<String> categoryNames = [
    "Audio",
    "Automotive",
    "Farming",
    "Construction",
    "Power",
    "Outdoor",
  ];

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
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
            Text(
              "Category",
              style: Constant.textAddOrange1,
            ),
            const SizedBox(height: 10, width: 10),
          ],
        ),
      ),
      body:
      ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryNames.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(categoryNames[index],style: Constant.textStartBlack,),
                trailing:  const Icon(Icons.arrow_forward_ios_outlined,size: 20,color: MyColor.blackColor,),
                onTap: () {
                 Get.to(()=>const EquipmentAudio());
                },
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.h),
                child: Divider(color: MyColor.greyColor.withOpacity(.5)),
              )
            ],
          );
        },
      ),
    );
  }
}

