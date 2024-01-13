import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_project/constants/constans.dart';
import 'package:movies_project/models/genres_model.dart';

class NewsWebService {
  static var client = http.Client();

  static Future<List<Data>?> fetchMoviesData() async {
    var response = await client.get(Uri.parse(Constants.topHeadlines));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData['data'] as List).map((e) => Data.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
