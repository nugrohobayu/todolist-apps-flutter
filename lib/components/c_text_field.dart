import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextField extends StatelessWidget {
  final String name;
  final String? initialValue;
  final VoidCallback? onTap;
  final VoidCallback? onSubmit;
  final bool? enabled;
  final bool? readOnly;
  final String? hintText, errorText;
  final TextEditingController? ctrl;
  final Widget? suffixIcon, suffixLable;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final TextInputFormatter? inputFormatters;
  final TextStyle? errorStyle, hintTextStyle;
  final _borderRadius = const BorderRadius.all(Radius.circular(12));
  final _borderColor = const Color.fromARGB(255, 167, 178, 204);
  final bool? textrea;
  final Widget? trailingTitleWidget;
  final BoxConstraints? suffixIconConstraints;
  final bool? disableColor;
  final bool? enableInteractiveSelection;

  const CTextField(
      {Key? key,
      required this.name,
      this.initialValue,
      this.onTap,
      this.onSubmit,
      this.enabled,
      this.readOnly,
      this.hintText,
      this.errorText,
      this.ctrl,
      this.suffixIcon,
      this.suffixLable,
      this.prefixIcon,
      this.keyboardType,
      this.validator,
      this.obscureText,
      this.maxLength,
      this.onChanged,
      this.inputFormatters,
      this.errorStyle,
      this.hintTextStyle,
      this.textrea,
      this.trailingTitleWidget,
      this.suffixIconConstraints,
      this.disableColor,
      this.enableInteractiveSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.size.height * 0.08,
      child: TextField(
        controller: ctrl,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: name,
          // errorText: validator
        ),
      ),
    );
  }
}
