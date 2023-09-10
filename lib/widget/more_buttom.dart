import 'package:flutter/material.dart';
import 'package:modern_football/assets/values/AppColors.dart';

class MoreButton extends StatelessWidget {
  double? size;
  MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
     splashRadius: 1,
        onPressed: () {},
        icon: Icon(
          Icons.more_vert_outlined,
          size: size ?? 28,
          color: Color(AppColors.primary),
        ));
  }
}