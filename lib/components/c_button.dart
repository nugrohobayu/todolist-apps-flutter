import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Widget? prefixIcon, suffixIcon;
  final double? height, width, widthSuffix, widthPrefix;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isSecondaryColor, isOutlined, heightWrapContent, disabled;
  final Color? backgroundColor, textColor;
  final MainAxisAlignment? mainAxisAlignmentContent;
  // final _widthBtn = SizeConfig.screenWidth / 1.5;
  // final _heightBtn = SizeConfig.screenHeight / 12;
  final FontWeight? textWeight;
  final double? textSize;
  final int? maxLines;
  const CButton(
      {Key? key,
      required this.name,
      required this.onPressed,
      this.prefixIcon,
      this.suffixIcon,
      this.height,
      this.width,
      this.widthSuffix,
      this.widthPrefix,
      this.contentPadding,
      this.isSecondaryColor,
      this.isOutlined,
      this.heightWrapContent,
      this.disabled,
      this.backgroundColor,
      this.textColor,
      this.mainAxisAlignmentContent,
      this.textWeight,
      this.textSize,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.size.height * 0.075,
      width: mediaQuery.size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            fontWeight: textWeight ?? FontWeight.w600,
            fontSize: textSize ?? 22,
          ),
        ),
      ),
    );
  }
}
