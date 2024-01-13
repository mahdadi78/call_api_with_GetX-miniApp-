import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/constants/constans.dart';
import 'package:movies_project/controller/new_controller.dart';
import 'package:movies_project/view/pages/status_pages/status_page.dart';

class MyCard extends StatelessWidget {
  final int index;
  MyCard({super.key, required this.index});
  final controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(IntroductionPage(index: index));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 120, right: 10, top: 20, bottom: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
              decoration: BoxDecoration(
                boxShadow: [Constants().boxShadow()],
                borderRadius: BorderRadius.circular(10),
                color: Constants.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          controller.dataList[index].title!,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        controller.dataList[index].imdbRating!,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Constants.mainColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgetMaker(index),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Hero(
                      tag: controller.dataList[index].id!,
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'Maid in: ' + controller.dataList[index].country!,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black38),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _image(),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Positioned(
      bottom: 32,
      left: 28,
      child: Hero(
        tag: controller.dataList[index].id!,
        child: SizedBox(
          width: 99,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
              aspectRatio: 9 / 14,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(controller.dataList[index].poster!)),
            ),
          ),
        ),
      ),
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
