import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/controller/controller.dart';
import 'package:movies_project/models/genres_model.dart';
import 'package:movies_project/view/pages/home_page/home_page.dart';
import 'package:movies_project/view/pages/status_movie_page.dart';
import 'package:movies_project/web_servise/get_servics.dart';

final controller = Get.put(AppController());

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

late List<Data> futureDataList;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetServic().getDatas().then((value) => futureDataList = value);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
