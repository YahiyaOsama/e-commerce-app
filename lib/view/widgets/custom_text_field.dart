import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/color_manager.dart';
import '../res/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.textEditingController,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.validator,
    this.onSave,
    this.inputFormatters,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onSave;
  final TextEditingController? textEditingController;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSiz.s60,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p11),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(AppSiz.s6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(AppSiz.s0_1),
            blurRadius: AppSiz.s6,
          ),
        ],
      ),
      child: TextFormField(
        onSaved: onSave,
        inputFormatters: inputFormatters,
        validator: validator,
        controller: textEditingController,
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 12, left: 10),
          hintStyle: const TextStyle(height: AppSiz.s1),
        ),
      ),
    );
  }
}
