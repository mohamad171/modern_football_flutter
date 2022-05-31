// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../../assets/values/AppColors.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.primary),
      body: Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              "lib/assets/images/auth.svg",
              height: 520,
            ),
          ),
          flex: 1,
        )
      ]),
    );
  }
}

class CircleButton extends StatelessWidget {
  Icon icon;

  CircleButton(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: this.icon,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(AppColors.primary),
          border: Border.all(
              color: Colors.white, width: 4, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
    );
  }
}
