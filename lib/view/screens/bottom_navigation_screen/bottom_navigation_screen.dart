import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/authentications/signup_screen.dart';
import 'package:opeec/view/screens/home_section/search_home_screen.dart';
import 'package:opeec/view/screens/inbox_home_screen/inbox_home_screen.dart';
import 'package:opeec/view/screens/rental_home_section/rental_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/my_color.dart';
import '../equipment_home_section/equipment_home_screen.dart';
import '../favourite_home_section/favourite_home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: MyColor.orangeColor,
        unselectedItemColor: MyColor.blackColor5,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        onTap: (value) {
          // Update current index on item tap
          currentIndex.value = value;
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/search.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 0 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Search",
              isSelected: currentIndex.value == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/heart.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 1 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Favorites",
              isSelected: currentIndex.value == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/equipment.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 2 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Equipment",
              isSelected: currentIndex.value == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/inbox.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 3 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Inbox",
              isSelected: currentIndex.value == 3,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/rental.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 4 ? MyColor.orangeColor : MyColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Rentals",
              isSelected: currentIndex.value == 4,
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (currentIndex.value) {
          case 0:
            return const SearchHomeScreen();
          case 1:
            return const FavouriteHomeScreen();
          case 2:
            return const EquipmentHomeScreen();
          case 3:
            return const InboxHomeScreen();
          case 4:
            return const RentalHomeScreen();
          default:
            return const SizedBox();
        }
      }),
    ));
  }

  Widget _buildNavItem({required Widget icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected
            ? Container(
          height: 5.px,
          decoration: const BoxDecoration(color:  MyColor.orangeColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          width: 55.px,
          margin: EdgeInsets.only(bottom: 5.px), // Adjust this value if needed to ensure it aligns perfectly
        )
            : SizedBox(height: 10.px),
        icon,
        Text(
          label,
          style: TextStyle(
            color: isSelected ? MyColor.orangeColor : MyColor.blackColor5,
            fontSize: 12.px,
          ),
        ),
      ],
    );
  }
}
