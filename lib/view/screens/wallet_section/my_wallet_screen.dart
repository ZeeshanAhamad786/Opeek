import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:opeec/view/custom_widgets/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/HistoryPaymentModel.dart';
import '../../../model/withdraw_model.dart';
class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  List<WithDrawModel> data=[
    WithDrawModel(dollar: '-\$23', time: '10:00 am , 12 jul 2023')
  ];
  List<HistoryPaymentModel> data1=[
    HistoryPaymentModel(dollar: '-\$23', name: 'Payment', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '-\$23', name: 'Withdraw', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),

  ];
  RxBool isDepositSelected = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 8.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              Text(
                "My Wallet",
                style: Constant.textProfile,
              ),
              SizedBox(height: 10.px, width: 10.px),
            ],
          ),
        ),
        getVerticalSpace(1.4.h),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 6.h,),
          decoration: const BoxDecoration( color: MyColor.orangeColor2,
              borderRadius:
          BorderRadius.only(bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24))),

          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Balance",style: Constant.textNameBalance,),
              getVerticalSpace(1.2.h),
              Text("\$23.0",style: Constant.textDollarBalance,),
            ],
          ),
        ),
        getVerticalSpace(2.h),
        Obx(() => Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isDepositSelected.value = true;
                    showPaymentBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: .5.h),
                    decoration: BoxDecoration(
                      color: isDepositSelected.value ? MyColor.orangeColor1 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyColor.orangeColor1),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Flexible(
                          child: SvgPicture.asset("assets/svg/deposit.svg",color: isDepositSelected.value ?
                          Colors.white : MyColor.orangeColor1),
                        ),
                        Expanded(
                          child: Text(textAlign: TextAlign.center,
                            'Deposit Now',
                            style: TextStyle(
                                color: isDepositSelected.value ? Colors.white : MyColor.orangeColor1,
                                fontSize: 14.px,fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.h),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isDepositSelected.value = false;
                    showPaymentBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: .5.h),

                    decoration: BoxDecoration(
                      color: isDepositSelected.value ? Colors.white : MyColor.orangeColor1,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyColor.orangeColor1),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SvgPicture.asset("assets/svg/withDraw.svg",color: isDepositSelected.value ?MyColor.orangeColor1:
                          Colors.white  ),
                        ),
                        Expanded(
                          child: Text(textAlign: TextAlign.center,
                            'Withdraw Request',
                            style: TextStyle(
                                color: isDepositSelected.value ? MyColor.orangeColor1 : Colors.white,
                                fontSize: 14.px,fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                getVerticalSpace(5.h),
                  Text("Withdraw",style: Constant.textSignUpOrange,),
                  getVerticalSpace(2.h),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Withdraw Request",style: Constant.textBlackColor,),
                            getVerticalSpace(1.h),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].time,style: Constant.textWithBlack,),
                                Text(data[index].dollar,style: Constant.textRed,)
                              ],
                            ),
                            getVerticalSpace(1.3.h),
                            const Divider(color: MyColor.greyColor,)
                          ],
                        );
        
                      }),
                  getVerticalSpace(2.h),
                  Text("History",style: Constant.textSignUpOrange,),
                  getVerticalSpace(2.h),
        
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data1.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data1[index].name,
                            style: Constant.textBlackColor,),
                          getVerticalSpace(1.h),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data1[index].time,style: Constant.textWithBlack,),
                              Text(data1[index].dollar,
                                style: data1[index].name == "Deposit"
                                    ? Constant.textGreen
                                    : Constant.textRed,
                              ),
                            ],
                          ),
                          getVerticalSpace(1.3.h),
                          const Divider(color: MyColor.greyColor,)
                        ],
                      );
        
                    }),
              ],
            ),
          ),
        ),
      )
      ],),
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
