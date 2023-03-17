import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  static BmiController get instance => Get.find();
  
  //get data from textfields
  final height = TextEditingController();
  final weight = TextEditingController();
  String errMessage = '';
  bool isMetric = true;
  bool isImperial = false;
  bool validate = false;
  late List<bool> isSelected = [isMetric, isImperial];

  String findBMI() {
    double bmi = 0;
    double heightValue = double.tryParse(height.text) ?? 0;
    double weighValue = double.tryParse(weight.text) ?? 0;
    if (validation()) {
      if (isMetric) {
        bmi = weighValue / (heightValue * heightValue);
      } else {
        bmi = weighValue * 703 / (heightValue * heightValue);
      }
    }
    update();
    return bmi.toStringAsFixed(2);
  }

  bool validation() {
    if (weight.text.isEmpty || height.text.isEmpty) {
      errMessage = 'Fields Can\'t Be Empty';
      validate = false;
      return false;
    } else {
      validate = true;
      return true;
    }
  }
}
