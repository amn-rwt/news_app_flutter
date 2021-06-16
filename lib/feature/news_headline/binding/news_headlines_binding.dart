import 'package:get/get.dart';
import 'package:news_app/core/repoistry/news_resp_impl.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
