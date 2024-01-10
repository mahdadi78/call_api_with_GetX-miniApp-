import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/view/appbar_const.dart';
import 'package:movies_project/const.dart';
import 'package:movies_project/controller/controller.dart';
import 'package:movies_project/view/pages/home_page/home_page_widgets/listviewbuilder_items.dart';
import 'package:movies_project/web_servise/get_servics.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(),
        body: FutureBuilder(
            future: GetServic().getDatas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const ListViewBuilderItems();
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
