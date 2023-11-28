import 'package:bhaladawala_app/utils/app_colors.dart';
import 'package:bhaladawala_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String hintText2;
  String? labelText;
  final bool obscure;
  final bool suffixIcon;
  final VoidCallback? onPressedOnToggle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscure = false,
    this.labelText,
    required this.hintText2,
    this.suffixIcon = false,
    this.onPressedOnToggle,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          style: const TextStyle(
              fontFamily: AppFonts.fontInterMedium, fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02),
          height: 51,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              border: Border.all(
                color: AppColors.grey,
                width: 1, // Set the width of the border
              ),
              borderRadius: const BorderRadius.all(Radius.circular(13))),
          child: TextFormField(
            validator: widget.validator,
            cursorColor: AppColors.appColor,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 13),
            obscureText: widget.obscure,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.008,
              ),
              isDense: true,
              border: InputBorder.none,
              hintText: widget.labelText ?? widget.hintText2,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: Visibility(
                visible: widget.suffixIcon,
                child: IconButton(
                    color: AppColors.grey,
                    icon: Icon(
                      size: 16,
                      widget.obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: widget.onPressedOnToggle),
              ),
              fillColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
