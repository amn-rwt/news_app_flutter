import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/repoistry/news_repo.dart';
import 'package:news_app/core/repoistry/news_resp_impl.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsheadlines();
  }

  RxBool isLoading = false.obs;

  RxList<Article> articles;

  loadNewsheadlines() async {
    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print('No data recived');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
