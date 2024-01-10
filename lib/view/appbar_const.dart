import 'package:flutter/material.dart';

class AppBarWidgets {
  Widget action() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black54,
          )),
    );
  }

  Widget title() {
    return const Image(fit: BoxFit.cover, image: AssetImage('images/text.png'));
  }
}
