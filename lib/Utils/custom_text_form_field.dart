import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AppManager/ThemeColor.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.enabled,
      this.keyboardType,
      this.maxLines,
      this.maxLength});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;


  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;
  bool? enabled;
  TextInputType? keyboardType;
  int? maxLines;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: (width ?? 0),
      margin: margin,
      child: TextFormField(
          keyboardType: keyboardType,
          enabled: enabled,
          controller: controller,
          focusNode: focusNode,
          style: _setFontStyle(),
          obscureText: isObscureText!,
          textInputAction: textInputAction,
          decoration: _buildDecoration(),
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      counterText: "",
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.PoppinsRegular14:
        return TextStyle(
          color: AppColor.gray601,
          fontSize: (14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsMedium16:
        return TextStyle(
          color: AppColor.whiteA700,
          fontSize: (16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.PoppinsRegular14Gray803:
        return TextStyle(
          color: AppColor.gray803,
          fontSize: (14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsMedium14:
        return TextStyle(
          color: AppColor.lightBlue800,
          fontSize: (14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.PoppinsRegular14Lightblue800:
        return TextStyle(
          color: AppColor.lightBlue800,
          fontSize: (14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsMedium14Gray803:
        return TextStyle(
          color: AppColor.gray803,
          fontSize: (14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: AppColor.gray600,
          fontSize: (
              //change
              18),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.CircleBorder25:
        return BorderRadius.circular(
          (25.00),
        );
      default:
        return BorderRadius.circular(
          (12.00),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.FillGray50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillWhiteA7004c:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBluegray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppColor.bluegray100,
            width: 1,
          ),
        );
      case TextFormFieldVariant.Outline:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppColor.gray301,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillGray50:
        return AppColor.gray50;
      case TextFormFieldVariant.FillWhiteA7004c:
        return AppColor.whiteA7004c;
      case TextFormFieldVariant.OutlineBluegray100:
        return AppColor.whiteA700;
      case TextFormFieldVariant.Outline:
        return AppColor.gray50;
      default:
        return AppColor.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.FillGray50:
        return true;
      case TextFormFieldVariant.FillWhiteA7004c:
        return true;
      case TextFormFieldVariant.OutlineBluegray100:
        return true;
      case TextFormFieldVariant.Outline:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingTB25:
        return EdgeInsets.only(
          left: 24,
          top: 24,
          right: 24,
          bottom: 25,
        );
      case TextFormFieldPadding.PaddingTB19:
        return EdgeInsets.only(
          left: 15,
          top: 15,
          right: 15,
          bottom: 19,
        );
      case TextFormFieldPadding.PaddingT18:
        return EdgeInsets.only(
          left: 15,
          top: 18,
          right: 15,
          bottom: 15,
        );
      case TextFormFieldPadding.PaddingTB17:
        return EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 17,
        );
      default:
        return EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 21,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder12,
  CircleBorder25,
}

enum TextFormFieldPadding {
  PaddingTB21,
  PaddingTB25,
  PaddingTB19,
  PaddingT18,
  PaddingTB17,
}

enum TextFormFieldVariant {
  OutlineGray301,
  FillGray50,
  FillWhiteA7004c,
  OutlineBluegray100,
  Outline,
}

enum TextFormFieldFontStyle {
  PoppinsRegular14Gray600,
  PoppinsRegular14,
  PoppinsMedium16,
  PoppinsRegular14Gray803,
  PoppinsMedium14,
  PoppinsRegular14Lightblue800,
  PoppinsMedium14Gray803,
}
