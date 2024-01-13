import 'package:flutter/material.dart';

class Constants {
  static const apiKey = '';
  static const topHeadlines = 'https://moviesapi.ir/api/v1/movies$apiKey';

  static const backgroundColor = Color(0xfffafafa);
  static const cardColor = Color(0xffffffff);
  static const mainColor = Color(0xfff8b90a);
  BoxShadow boxShadow() {
    return BoxShadow(
      blurRadius: 4,
      offset: const Offset(0, 5),
      blurStyle: BlurStyle.outer,
      color: Colors.grey.shade300,
    );
  }
}
