import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opeec/controller/utils/my_color.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:opeec/view/screens/profile_section/profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../model/construction_model.dart';
import '../../custom_widgets/search_customtextfield_screen.dart';
class SearchHomeScreen extends StatefulWidget {
  const SearchHomeScreen({Key? key}) : super(key: key);

  @override
  State<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {
  List<String> images = [
    "assets/png/audio.png",
    "assets/png/automative.png",
    "assets/png/farming.png",
    "assets/png/construction.png",
    "assets/png/power.png",
  ];
  List<String> profileNames = [
    "Audio",
    "Automotive",
    "Farming",
    "Construction",
    "Power",
  ];
  List<ConstructionModel> data=[
    ConstructionModel(imageUrl: 'assets/png/drill.png', name: 'Rotary Tool', construction: 'construction',
        dollar: '\$54/day', location: 'Kent, Utah'),
    ConstructionModel(imageUrl: 'assets/png/glawz.png', name: 'Corona, Michigan', construction: 'construction',
        dollar: '\$54/day', location: 'Corona, Michigan'),
    ConstructionModel(imageUrl: 'assets/png/kit.png', name: 'Biscuit Joiner', construction: 'construction',
        dollar: '\$54/day', location: 'Portland, Illinois'),
    ConstructionModel(imageUrl: 'assets/png/parashoot.png', name: 'Belt Sander', construction: 'construction',
        dollar: '\$54/day', location: 'Stockton, New Hampshire'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(children: [
          getVerticalSpace(8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Search",style: Constant.textSearchOrange1,),
                      Text("Find the perfect equipment with ease",style: Constant.textPerfectBlack6,),
                    ],
                  ),
                ),
              GestureDetector(onTap: () {
                Get.to(()=>const ProfileScreen());
              },
                  child: Image.asset("assets/png/profileIcon.png",height: 40,width: 40,))
              ],
            ),
          getVerticalSpace(1.5.h),
          Row(
            children: [
              Expanded(
                child: SearchCustomTextFormField(hintText: 'Search equipment',prefixIcon: SvgPicture.asset("assets/svg/searchOrange.svg"),
                ),
              ),
              getHorizontalSpace(1.5.h),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: MyColor.greyColor2,
                    borderRadius: BorderRadius.circular(8)),
                child: SvgPicture.asset("assets/svg/step.svg"),
              )
            ],
          ),
          getVerticalSpace(1.5.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories ",style: Constant.textEmailBlack,),
              Text("Sell all ",style: Constant.textSeeAllOrange1,),
            ],
          ),
          getVerticalSpace(1.h),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Your onTap code here
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            images[index],
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.height / 10,
                            fit: BoxFit.cover,
                          ),
                        ),
                        getVerticalSpace(0.5.h),
                        Expanded(
                          child: Text(
                            profileNames[index],
                            style: Constant.textAudioBlack
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          getVerticalSpace(3.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 1.w, // Space between columns
                mainAxisSpacing: 2.h, // Space between rows
                childAspectRatio: 0.8, // Adjust if necessary
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child:
                            Obx(()=>  GestureDetector( onTap:(){
                item.isFavorite.value = !item.isFavorite.value;

                },
                                child: Icon(
                                  item.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                                  color: item.isFavorite.value ? Colors.orange : Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        item.construction,
                        style: Constant.textConstructionBlack5,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 0.3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: Constant.textNameBlack7,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            item.dollar,
                            style: Constant.textSeeAllOrange1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.5.h),
                      Row(
                        children: [
                          RatingBar(
                            filledIcon: Icons.star,
                            filledColor: MyColor.orangeColor1,
                            size: 10,
                            emptyIcon: Icons.star_border,
                            onRatingChanged: (value) => debugPrint('$value'),
                            initialRating: 5,
                            maxRating: 5,
                          ),
                          SizedBox(width: 0.5.h),
                          Expanded(
                            child: Text(
                              "5.0",
                              style: Constant.textNameBlack8,
                            ),
                          ),
                        ],
                      ),
                      getVerticalSpace(.5.h),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/location.svg"),
                          getHorizontalSpace(.5.w),
                          Expanded(
                            child: Text(
                              item.location,
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
                );
              },
            ),
          )


        ],),
      ),
    );
  }
}
