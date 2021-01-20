import 'package:bankappsplashscreen/models/datamodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';

class Controller extends GetxController {
  final data = [DataModel(body: null)].obs;
  PageController pageController;
  final activeIndex = 0.obs;
  final List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    getData();
    super.onInit();
  }

  skipSplashScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("It works!"),
        );
      },
    );
  }

  getData() {
    data.clear();
    data.addAll(dataModelFromJson(jsonData));
    print(data.first.subtitle);
  }
}
