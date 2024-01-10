import 'package:get/get.dart';
import 'package:movies_project/models/genres_model.dart';
import 'package:movies_project/web_servise/get_servics.dart';

class AppController extends GetxController {
  var isLoading = false.obs;
  late List<Data> futureDataList;
  Data? data;

  @override
  Future<void> onInit() async {
    super.onInit();
    GetServic().getDatas().then((value) => futureDataList = value);
  }
}
  // fillGenresList() async {
  //   for (int i = 0; i < futureDataList.length; i++) {
  //     for (int j = 0; j < futureDataList[i].genres!.length; j++) {
  //       genresList[i] = futureDataList[i].genres![j];
  //     }
  //   }
  // }

