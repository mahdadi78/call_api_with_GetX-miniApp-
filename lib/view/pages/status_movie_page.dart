import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/const.dart';
import 'package:movies_project/controller/controller.dart';
import 'package:movies_project/main.dart';

class StatusMovie extends StatelessWidget {
  final int index;
  StatusMovie({super.key, required this.index});
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image(image: NetworkImage(futureDataList[index].poster!)),
          )
        ],
      ),
    );
  }

  AppBar myAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const CircleAvatar(
        radius: 17,
        backgroundColor: Colors.white30,
        child: Icon(
          Icons.arrow_back_ios_sharp,
          size: 20,
          color: Colors.white,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white30,
            child: Icon(
              Icons.more_horiz_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
