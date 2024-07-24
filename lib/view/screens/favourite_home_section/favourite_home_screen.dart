import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/construction_model.dart';
import '../../custom_widgets/sized_widget.dart';
class FavouriteHomeScreen extends StatefulWidget {
  const FavouriteHomeScreen({super.key});

  @override
  State<FavouriteHomeScreen> createState() => _FavouriteHomeScreenState();
}

class _FavouriteHomeScreenState extends State<FavouriteHomeScreen> {
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
    ConstructionModel(imageUrl: 'assets/png/glawz.png', name: 'Jigsaw', construction: 'construction',
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          getVerticalSpace(8.h),
          Text("Favorites",style: Constant.textSearchOrange1,),
          Text("Quickly access and manage your favorite equipments",style: Constant.textPerfectBlack6,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 1.w, // Space between columns
                  mainAxisSpacing: 2.h, // Space between rows
                  childAspectRatio: 0.7, // Adjust if necessary
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          item.construction,
                          style:Constant.textConstructionBlack5,
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
                                style:Constant.textNameBlack7,
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
                              filledColor:  MyColor.orangeColor1,
                              size: 10,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) => debugPrint('$value'),
                              initialRating: 5,
                              maxRating: 5,
                            ),
                            SizedBox(width: 0.5.h),
                            Expanded(
                                child: Text("5.0",style: Constant.textNameBlack8,))
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
