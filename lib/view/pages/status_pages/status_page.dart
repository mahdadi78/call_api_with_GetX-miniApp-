import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white54,
            ),
          )),
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
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -95,
                              left: 20,
                              child: Hero(
                                tag: controller.dataList[index].id!,
                                child: SizedBox(
                                  width: 170,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: AspectRatio(
                                      aspectRatio: 9 / 14,
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(controller
                                              .dataList[index].poster!)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            informationCard(size),
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

  Widget informationCard(Size size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: size.width / 2, top: 30, right: 30),
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
                  children: widgetMakerIMDB(index),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Hero(
                    tag: controller.dataList[index].id!,
                    child: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      widgetMakerIMDB(index).length > 1
                          ? 'Product of the country : ${controller.dataList[index].country!}'
                          : 'Joint product : ${controller.dataList[index].country!}',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Year of construction : ${controller.dataList[index].year!}',
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
                _ratingStars(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Introduction',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 15),
              const Text(
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae metus vel orci cursus suscipit at quis eros. Ut metus quam, tincidunt non vestibulum nec, ornare sit amet ipsum. Sed placerat pellentesque urna, vitae auctor mauris tincidunt imperdiet. Nunc nec ultrices purus. Sed pellentesque at ante vitae consectetur. Suspendisse molestie, tellus sit amet sollicitudin rhoncus, nibh felis iaculis sem, gravida ultrices est sapien vitae lectus. Pellentesque rhoncus risus vel arcu mollis euismod. Aenean commodo suscipit orci, id volutpat mauris. Vestibulum mauris leo, volutpat ut condimentum blandit, accumsan in risus. Curabitur ut rutrum justo. Donec scelerisque ante in ullamcorper congue. Suspendisse a tortor ac ex finibus iaculis. Pellentesque nec euismod orci.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    collectButton(),
                    buyButton(),
                  ],
                ),
              ),
              //* showing images in this field
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Actor',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'see All >',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: widgetMakerImages(index),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget buyButton() {
    return Container(
      alignment: Alignment.center,
      width: 190,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.mainColor,
      ),
      child: const Text(
        'Buy now',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget collectButton() {
    return Container(
      alignment: Alignment.center,
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: const Text(
        'Collect',
        style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _ratingStars() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            initialRating: double.parse(controller.dataList[index].imdbRating!),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 10,
            itemSize: 11,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              size: 1,
              color: Colors.amber,
            ),
            ignoreGestures: true,
            onRatingUpdate: (rating) {},
          ),
          Text(
            controller.dataList[index].imdbRating!,
            style: const TextStyle(
                color: Constants.mainColor, fontWeight: FontWeight.w800),
          )
        ],
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

  List<Widget> widgetMakerIMDB(int index) {
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

  List<Widget> widgetMakerImages(int index) {
    List<Widget> myList = [];
    for (int i = 0; i < controller.dataList[index].images!.length; i++) {
      myList.add(Padding(
        padding: const EdgeInsets.only(right: 5, top: 10),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(controller.dataList[index].images![i]),
        ),
      ));
    }
    return myList;
  }
}
