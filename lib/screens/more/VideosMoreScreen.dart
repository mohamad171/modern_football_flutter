// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/values/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modern_football/widgets.dart';

class VideosMoreScreen extends StatefulWidget {
  const VideosMoreScreen({Key? key}) : super(key: key);

  @override
  State<VideosMoreScreen> createState() => _VideosMoreScreenState();
}

class _VideosMoreScreenState extends State<VideosMoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
      )),
      backgroundColor: Color(AppColors.bg_gray),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onTap: () => Get.back(),
                  ),
                  const Text(
                    "ویدئوهای لیگ جزیره",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("ok"),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      )),
    );
  }
}