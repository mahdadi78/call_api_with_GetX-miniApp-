import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/controller/new_controller.dart';
import 'package:movies_project/view/appbar_const.dart';
import 'package:movies_project/const.dart';
import 'package:movies_project/view/pages/home_page/card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _newController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(),
        body: Obx(
          () => _newController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _newController.dataList.length,
                  itemBuilder: (context, index) {
                    return MyCard(index: index);
                  },
                ),
        ));
  }

  AppBar _appbar() {
    return AppBar(
      actions: [
        AppBarWidgets().action(),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: AppBarWidgets().title(),
    );
  }
}
