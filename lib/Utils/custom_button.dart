import 'package:flutter/material.dart';

import '../AppManager/ThemeColor.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: (width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll6:
        return EdgeInsets.all(6);
      case ButtonPadding.PaddingAll17:
        return EdgeInsets.all(17);
      case ButtonPadding.PaddingAll21:
        return EdgeInsets.all(21);
      default:
        return EdgeInsets.all(10);
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillRed200:
        return AppColor.red200;
      case ButtonVariant.OutlineGray300:
        return AppColor.gray200;
      case ButtonVariant.Outline:
        return AppColor.whiteA70075;
      case ButtonVariant.OutlineGray4003f:
        return AppColor.teal500;
      case ButtonVariant.FillAmber200:
        return AppColor.amber200;
      case ButtonVariant.GradientLightblue800Blue500:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.Outline1_2:
        return null;
      default:
        return AppColor.whiteA700;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return Border.all(
          color: AppColor.gray300,
          width: (1.00),
        );
      case ButtonVariant.OutlineWhiteA700:
        return Border.all(
          color: AppColor.whiteA700,
          width: (1.00),
        );
      case ButtonVariant.OutlineBluegray400:
      case ButtonVariant.FillRed200:
      case ButtonVariant.GradientLightblue800Blue500:
      case ButtonVariant.OutlineGray4003f:
      case ButtonVariant.FillAmber200:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          (5.00),
        );
      case ButtonShape.RoundedBorder19:
        return BorderRadius.circular(
          (19.64),
        );
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          (10.00),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          (14.00),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.GradientLightblue800Blue500:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            AppColor.lightBlue800,
            AppColor.blue500,
          ],
        );
      case ButtonVariant.Outline1_2:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            AppColor.lightBlue800,
            AppColor.blue500,
          ],
        );
      case ButtonVariant.OutlineBluegray400:
      case ButtonVariant.FillRed200:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.Outline:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.OutlineGray4003f:
      case ButtonVariant.FillAmber200:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineGray4003f:
        return [
          BoxShadow(
            color: AppColor.gray4003f,
            spreadRadius: (2.00),
            blurRadius: (2.00),
            offset: Offset(
              0,
              10,
            ),
          )
        ];
      case ButtonVariant.FillRed200:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.Outline:
      case ButtonVariant.GradientLightblue800Blue500:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.Outline1_2:
      case ButtonVariant.FillAmber200:
        return null;
      default:
        return [
          BoxShadow(
            color: AppColor.bluegray400,
            spreadRadius: (2.00),
            blurRadius: (2.00),
            offset: Offset(
              0,
              1,
            ),
          )
        ];
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium13:
        return TextStyle(
          color: AppColor.whiteA700,
          fontSize: (13),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.Remixicon22:
        return TextStyle(
          color: AppColor.bluegray100,
          fontSize: (22),
          fontFamily: 'remixicon',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Remixicon24:
        return TextStyle(
          color: AppColor.lightBlue800,
          fontSize: (24),
          fontFamily: 'remixicon',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Remixicon24Red400:
        return TextStyle(
          color: AppColor.red400,
          fontSize: (24),
          fontFamily: 'remixicon',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium20:
        return TextStyle(
          color: AppColor.whiteA700,
          fontSize: (20),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsRegular12:
        return TextStyle(
          color: AppColor.whiteA700,
          fontSize: (12),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsSemiBold16:
        return TextStyle(
          color: AppColor.whiteA700,
          fontSize: (16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsMedium13Black900:
        return TextStyle(
          color: AppColor.black900,
          fontSize: (13),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: AppColor.black900,
          fontSize: (25),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder5,
  CircleBorder14,
  RoundedBorder19,
  RoundedBorder10,
}

enum ButtonPadding {
  PaddingAll10,
  PaddingAll6,
  PaddingAll17,
  PaddingAll21,
}

enum ButtonVariant {
  OutlineBluegray400,
  FillRed200,
  OutlineGray300,
  Outline,
  GradientLightblue800Blue500,
  OutlineWhiteA700,
  Outline1_2,
  OutlineGray4003f,
  FillAmber200,
}

enum ButtonFontStyle {
  SFProDisplayRegular25,
  PoppinsMedium13,
  Remixicon22,
  Remixicon24,
  Remixicon24Red400,
  PoppinsMedium20,
  PoppinsRegular12,
  PoppinsSemiBold16,
  PoppinsMedium13Black900,
}
