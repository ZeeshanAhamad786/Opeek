import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/controller/utils/constant.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EquipmentAudio extends StatefulWidget {
  const EquipmentAudio({super.key});

  @override
  State<EquipmentAudio> createState() => _EquipmentAudioState();
}

class _EquipmentAudioState extends State<EquipmentAudio> {
  // List of category names
  final List<String> categoryName1 = [
    "Audio Mic",
    "Speaker",
    "Headphone",
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
              "Audio",
              style: Constant.textAddOrange1,
            ),
            const SizedBox(height: 10, width: 10),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: categoryName1.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(categoryName1[index],style: Constant.textStartBlack,),
                onTap: () {
                  // Handle tap here, if needed
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

