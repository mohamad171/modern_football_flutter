import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchesDetails extends StatefulWidget {
  const MatchesDetails({Key? key}) : super(key: key);

  @override
  State<MatchesDetails> createState() => _MatchesDetailsState();
}

class _MatchesDetailsState extends State<MatchesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    size: 25,
                  ),
                  onTap: () => Get.back(),
                ),
                const Text(
                  "رئال مادرید - بارسلونا",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/main"),
                  child: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      size: Size(100, 100),
                      child: Image.network(
                          'https://www.realmadrid.com/StaticFiles/RealMadridResponsive/images/static/og-image.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "رئال مادرید",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 5,
                      ),
                      Text("1401/04/08")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("هفته 5"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.access_time_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "23:30",
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      size: Size(90, 90),
                      child: Image.network(
                          'https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "بارسلونا",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
