import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../../assets/values/AppColors.dart';
import '../../models/response_models/news.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  NewsController newsController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    News news = newsController.news[Get.arguments["index"]];
    return Scaffold(
      backgroundColor: Color(AppColors.bg_gray),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 20,
                    splashRadius: 25,
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Text(
                      news.title!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  IconButton(
                    iconSize: 25,
                    onPressed: () => Get.toNamed("/main"),
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox.fromSize(
                            size: const Size(120, 110),
                            child: Image.network(news.image!, fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Icon(Icons.image_outlined,size: 50,color: Colors.grey.withOpacity(0.6),)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Text(
                                news.title!,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey.withOpacity(0.5),
                            height: 1,
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Color(AppColors.primary),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6))),
                                  child: const Text(
                                    "ورزش 3",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    news.get_created_at(),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  alignment: Alignment.bottomLeft,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Html(
                      data: news.description!,
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
