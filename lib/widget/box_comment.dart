import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxComment extends StatelessWidget {
  const BoxComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: TextField(
        cursorHeight: 11,
        textAlign: TextAlign.right,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: "...کامنت"),
      ),
      width: Get.width / 1.1,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade500),
      ),
    );
  }
}
