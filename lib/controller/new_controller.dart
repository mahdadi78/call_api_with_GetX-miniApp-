import 'package:get/get.dart';
import 'package:movies_project/models/genres_model.dart';
import 'package:movies_project/web_servise/new_web_service.dart';

class NewsController extends GetxController {
  var dataList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  void fetchArticle() async {
    isLoading(true);

    try {
      isLoading(true);
      var eachData = await NewsWebService.fetchMoviesData();
      if (eachData != null) {
        dataList(eachData);
      }
    } finally {
      isLoading(false);
    }
  }
}
