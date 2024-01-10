import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_project/models/genres_model.dart';

class GetServic {
  Future<List<Data>> getDatas() async {
    List<Data> myGenresList = [];

    // https://moviesapi.ir/api/v1/movies
    var response = await http.get(Uri.https('moviesapi.ir', '/api/v1/movies'));
    var jsonData = jsonDecode(response.body);

    for (var eachGenres in jsonData[
        'data'] /*['data']      For more complex APIs, this section is used*/) {
      final myData = Data(
        genres: eachGenres['genres'],
        country: eachGenres['country'],
        id: eachGenres['id'],
        images: eachGenres['images'],
        imdbRating: eachGenres['imdb_rating'],
        poster: eachGenres['poster'],
        title: eachGenres['title'],
        year: eachGenres['year'],
      );
      myGenresList.add(myData);
    }
    return myGenresList;
  }
}
