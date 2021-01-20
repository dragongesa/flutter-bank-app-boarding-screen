import 'package:bankappsplashscreen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller(), tag: "splashController");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: Obx(() => PageView.builder(
                        controller: controller.pageController,
                        itemCount: controller.data.length,
                        onPageChanged: (value) {
                          controller.activeIndex.value = value;
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image.asset(
                                  controller.images[index],
                                  width: MediaQuery.of(context).size.width - 80,
                                  height: MediaQuery.of(context).size.width - 80,
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Text(
                                  controller.data[index].subtitle,
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.data[index].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                    controller.data[index].body,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count: controller.data.length,
                        effect: ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 5,
                            expansionFactor: controller.data.length.toDouble()),
                      ),
                    )),
                Obx(() => Material(
                      color: (controller.data.length ==
                              controller.activeIndex.value + 1)
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.fastOutSlowIn,
                          width: (controller.data.length ==
                                  controller.activeIndex.value + 1)
                              ? 120
                              : 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue, width: 1)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          child: Text(
                            (controller.data.length ==
                                    controller.activeIndex.value + 1)
                                ? "Get Started"
                                : "Next",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: (controller.data.length ==
                                        controller.activeIndex.value + 1)
                                    ? Colors.white
                                    : Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        onTap: () {
                          if (controller.data.length ==
                              controller.activeIndex.value + 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("It works!"),
                                );
                              },
                            );
                          } else {
                            controller.activeIndex.value += 1;
                            controller.pageController.animateToPage(
                                controller.activeIndex.value,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                      ),
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            ),
            Positioned(
              top: -50,
              right: -90,
              child: Transform.rotate(angle: .45,
              
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                  color: Colors.orange[300],
borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: SafeArea(child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: (){}, child:Icon(Icons.arrow_forward_rounded,color: Colors.white,))))
          ],
        ));
  }
}
