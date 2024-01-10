import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/controller/controller.dart';
import 'package:movies_project/view/appbar_const.dart';
import 'package:movies_project/const.dart';
import 'package:movies_project/view/pages/home_page/home_page_widgets/listviewbuilder_items.dart';
import 'package:movies_project/web_servise/get_servics.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(),
        body: FutureBuilder(
            future: GetServic().getDatas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListViewBuilderItems(
                  controller: controller,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
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
