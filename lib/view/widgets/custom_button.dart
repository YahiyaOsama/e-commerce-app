import 'package:flutter/material.dart';

import '../res/color_manager.dart';
import '../res/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onPressed});

  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: MediaQuery.sizeOf(context).height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSiz.s16),
          color: ColorManager.primary,
          boxShadow: [
            BoxShadow(
              color: ColorManager.blackColor.withOpacity(AppSiz.s0_1),
              blurRadius: AppSiz.s10,
            )
          ],
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: AppSiz.s18, color: textColor),
        ),
      ),
    );
  }
}
