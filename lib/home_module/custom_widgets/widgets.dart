import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/constants/colors.dart';
import 'package:test_project/constants/text_styles.dart';

Widget customText({
  String title = "",
  TextStyle? style,
}) {
  return Text(
    title,
    style: style,
  );
}

Widget customTextField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
}) {
  return TextField(
    maxLines: 1,
    keyboardType: TextInputType.number,
    controller: controller,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(15, 22, 12, 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.orange)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.orange)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.orange)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.orange)),
      labelText: labelText,
      hintText: hintText,
    ),
    cursorColor: AppColors.black,
  );
}

Widget iconButton({required void Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(10),
      backgroundColor: Colors.orange,
    ),
    child: const Icon(
      Icons.arrow_forward_ios_outlined,
      color: Colors.white,
    ),
  );
}

Widget labelButton({required void Function()? onPressed}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.white.withOpacity(0.2),
    ),
    icon: const Icon(
      Icons.arrow_back_ios,
      color: AppColors.black,
      size: 14,
    ),
    label: customText(
      title: "Back",
      style: AppTextStyles.smallTextStyle,
    ),
  );
}

Widget customHeight(double? height) {
  return SizedBox(
    height: height,
  );
}
