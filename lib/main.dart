import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/news_headline/binding/news_headlines_binding.dart';
import 'package:news_app/feature/news_headline/view/news_headline_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      getPages: [
        GetPage(
            name: '/news_headlines',
            page: () => NewsHomepage(),
            binding: NewsHeadlineBinding()),
      ],
      initialRoute: '/news_headlines',
    );
  }
}
