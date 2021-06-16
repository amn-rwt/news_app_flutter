import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';
import 'package:news_app/sizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsHomepage extends StatelessWidget {
  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: Obx(() {
      return controller.isLoading.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
              itemCount: controller.articles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConfig.blockSizeVertical * 35,
                          child: controller.articles[index].imageUrl == null
                              ? Center(child: Text('Image not found'))
                              : Image.network(
                                  controller.articles[index].imageUrl,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 60,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                controller.articles[index].title,
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.articles[index].description,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Spacer(),
                              Text('swipe right for more',
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    primary: Color(0xFF345B78),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                  ),
                                  onPressed: () async {
                                    await FlutterWebBrowser.openWebPage(
                                      url: controller.articles[index].url,
                                      customTabsOptions: CustomTabsOptions(
                                        toolbarColor: Color(0xFF345B78),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Read full article',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    }));
  }
}
