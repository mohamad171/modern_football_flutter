import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class BoxComment extends StatelessWidget {
  ImageProvider<Object>? provider;
  String? imageProfaile;
  String? hintText;
  Function()? onTapIconSend;
  TextEditingController? controller;
  BoxComment({this.imageProfaile, this.provider,this.onTapIconSend, this.hintText,this.controller, super.key})
  
   {
    if (imageProfaile == null) {
      provider = AssetImage('lib/assets/images/ic_player_default.png');
    } else {
      provider = NetworkImage(imageProfaile!);
    }
  }
  
  @override
  Widget build(BuildContext context) {
 
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: this.provider,
              )),
          Container(
            // padding: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade500),
            ),
            height: 40,
            width: Get.width / 1.3,
            child: TextField(
              
              controller: controller,
              textDirection: TextDirection.rtl,
              cursorHeight: 11,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
               suffixIcon: IconButton(icon: Icon(Icons.send,size: 17,),onPressed: onTapIconSend,),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 15
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
