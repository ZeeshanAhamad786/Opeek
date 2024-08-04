import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomStepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    required this.selectedColor,
    required this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(totalSteps, (index) {
          bool isSelected = index < currentStep;
          bool isNextSelected = (index + 1) < currentStep;

          return Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? selectedColor : Colors.white,
                  border: Border.all(
                    color: isSelected ? selectedColor : unselectedColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : unselectedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (index < totalSteps - 1)
                Container(
                  width: 30,
                  height: 2,
                  color: isNextSelected ? selectedColor : unselectedColor,
                ),
            ],
          );
        }),
      ),
    );
  }
}
