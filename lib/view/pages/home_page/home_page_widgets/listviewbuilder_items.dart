import 'package:flutter/material.dart';
import 'package:movies_project/const.dart';
import 'package:movies_project/main.dart';

class ListViewBuilderItems extends StatelessWidget {
  const ListViewBuilderItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: futureDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                card(index),
                image(index),
              ],
            ),
          );
        });
  }

  Container card(int index) {
    return Container(
      padding: const EdgeInsets.only(left: 120, right: 10, top: 20, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 5),
            blurStyle: BlurStyle.outer,
            color: Colors.grey.shade300,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleAndImdbRating(index),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgetMaker(index),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              'Maid in: ' + futureDataList[index].country!,
              style: const TextStyle(fontSize: 12, color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> widgetMaker(int index) {
    List<Widget> myList = [];
    for (int i = 0; i < futureDataList[index].genres!.length; i++) {
      myList.add(Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border:
                Border.all(color: i < 1 ? mainColor : Colors.blue, width: .8)),
        child: Text(
          futureDataList[index].genres![i],
          style:
              TextStyle(fontSize: 10, color: i < 1 ? mainColor : Colors.blue),
        ),
      ));
    }
    return myList;
  }

  Positioned image(int index) {
    return Positioned(
      bottom: 32,
      left: 28,
      child: SizedBox(
        width: 99,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AspectRatio(
            aspectRatio: 9 / 14,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(futureDataList[index].poster!)),
          ),
        ),
      ),
    );
  }

  Row titleAndImdbRating(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            futureDataList[index].title!,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          futureDataList[index].imdbRating!,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w900, color: mainColor),
        ),
      ],
    );
  }
}
