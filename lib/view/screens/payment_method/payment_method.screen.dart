import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec/view/custom_widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widgets/sized_widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  void _onRadioButtonTap(int index) {
    selectedIndex.value = index; // Update selectedIndex with the tapped index
  }
  RxInt selectedIndex = 0.obs; // Define selectedIndex as RxInt

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    "Select Payment Method",
                    style: Constant.textProfile,
                  ),
                  SizedBox(height: 10.px, width: 10.px),
                ],
              ),
              getVerticalSpace(1.5.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                decoration: BoxDecoration(color: Color(0xffFAFAFA),borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   GestureDetector(onTap:(){
                     // showPaymentBottomSheet(context);

                   },
                       child: SvgPicture.asset("assets/svg/walletIcon.svg")),
                    getHorizontalSpace(2.w),
                    GestureDetector(onTap: () {
                      // showPaymentBottomSheet(context);
                    },
                        child: Text("OPEEC Wallet", style: Constant.textBlackColor)),
                    Spacer(),
                    Text("\$10", style: Constant.textBlackColor),
                    getHorizontalSpace(2.w),
                    // Outer Container with conditional color and border
                    GestureDetector(
                      onTap: () => _onRadioButtonTap(0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedIndex.value == 0
                                ? MyColor.orangeColor1
                                : Colors.grey,
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
                              color: MyColor.orangeColor1,
                            ),
                          ),
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
             getVerticalSpace(2.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                decoration: BoxDecoration(color: Color(0xffFAFAFA),borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(onTap:(){
                      // showPaymentBottomSheet(context);
                    },
                        child: SvgPicture.asset("assets/svg/credit.svg")),
                    getHorizontalSpace(2.w),
                    GestureDetector(onTap: () {
                      // showPaymentBottomSheet(context);
                    },
                        child: Text("Credit /Debit Card", style: Constant.textBlackColor)),
                    Spacer(),
                    Text("\$10", style: Constant.textBlackColor),
                    getHorizontalSpace(2.w),
                    // Outer Container with conditional color and border
                    GestureDetector(
                      onTap: () => _onRadioButtonTap(1),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedIndex.value == 1
                                ? MyColor.orangeColor1
                                : Colors.grey,
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
                              color: MyColor.orangeColor1,
                            ),
                          ),
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              getVerticalSpace(25.h),
              Center(
                child: CustomElevatedButton(width: 220.px,
                    text: "Next", onPressed: (){
                      showPaymentBottomSheet(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();
  final FocusNode cardHolderNameFocus = FocusNode();

  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/svg/card-add.svg"),
                  getHorizontalSpace(2.w),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add card",style: Constant.textBlack1,),
                        getVerticalSpace(.3.h),
                        Text("Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
                          style: Constant.textLight,),
                      ],
                    ),
                  )
                ],
              ),
              getVerticalSpace(1.h),
              Divider(color: MyColor.greyColor,),
              getVerticalSpace(4.h),
              TextFormField(
                focusNode: cardNumberFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "00000",
                  hintStyle: Constant.textBlack1,
                  labelText: 'Card Number',
                  labelStyle: cardNumberFocus.hasFocus
                      ? Constant.textForgotOrange
                      : Constant.textBlack1,
                  suffixIcon: Transform.scale(
                    scale: .4,
                    child: SvgPicture.asset(
                      "assets/svg/card.svg",
                      color: cardNumberFocus.hasFocus
                          ? MyColor.orangeColor1
                          : MyColor.greyColor7,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: MyColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: MyColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: expiryDateFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "MM/YY",
                        hintStyle: Constant.textBlack1,
                        labelText: 'Expiry Date',
                        labelStyle: expiryDateFocus.hasFocus
                            ? Constant.textForgotOrange
                            : Constant.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: .4,
                          child: SvgPicture.asset(
                            "assets/svg/calendar.svg",
                            color: expiryDateFocus.hasFocus
                                ? MyColor.orangeColor1
                                : MyColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: MyColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: MyColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 2.h),
                  Expanded(
                    child: TextFormField(
                      focusNode: cvvFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "***",
                        hintStyle: Constant.textBlack1,
                        labelText: 'CVV',
                        labelStyle: cvvFocus.hasFocus
                            ? Constant.textForgotOrange
                            : Constant.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            "assets/svg/info-circle.svg",
                            color: cvvFocus.hasFocus
                                ? MyColor.orangeColor1
                                : MyColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: MyColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: MyColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              TextFormField(
                focusNode: cardHolderNameFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Enter cardholder’s full name",
                  hintStyle: Constant.textBlack1,
                  labelText: 'Cardholder’s Name',
                  labelStyle: cardHolderNameFocus.hasFocus
                      ? Constant.textForgotOrange
                      : Constant.textBlack1,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: MyColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: MyColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  // Add your deposit logic here
                },
                child: Text(
                  'Next',
                  style: Constant.textCancel,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.orangeColor2,
                  padding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                    horizontal: 15.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
