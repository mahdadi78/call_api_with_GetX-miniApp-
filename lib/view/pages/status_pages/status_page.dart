import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/constants/constans.dart';
import 'package:movies_project/controller/new_controller.dart';

class IntroductionPage extends StatelessWidget {
  final int index;
  IntroductionPage({super.key, required this.index});
  final controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    blurImage(size),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        height: size.height * .75,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        //* page////////////////////////////////////////
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: size.width / 2, top: 30, right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.dataList[index].title!,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black87),
                                  ),
                                  Row(
                                    children: widgetMaker(index),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      widgetMaker(index).length > 1
                                          ? 'Product of the country : ${controller.dataList[index].country!}'
                                          : 'Joint product : ${controller.dataList[index].country!}',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black45),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Year of construction : ${controller.dataList[index].year!}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black45),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget blurImage(Size size) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: size.width,
          height: size.height * 0.30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(controller.dataList[index].poster!))),
        ),
        ClipRRect(
          // Clip it cleanly.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> widgetMaker(int index) {
    List<Widget> myList = [];
    for (int i = 0; i < controller.dataList[index].genres!.length; i++) {
      myList.add(Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: i < 1 ? Constants.mainColor : Colors.blue, width: .8)),
        child: Text(
          controller.dataList[index].genres![i],
          style: TextStyle(
              fontSize: 10, color: i < 1 ? Constants.mainColor : Colors.blue),
        ),
      ));
    }
    return myList;
  }
}
