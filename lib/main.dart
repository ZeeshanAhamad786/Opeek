import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec/view/screens/authentications/logo_screen.dart';
import 'package:opeec/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:opeec/view/screens/home_section/search_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
           home: const LogoScreen(),
        );
      },
    );
  }
}
