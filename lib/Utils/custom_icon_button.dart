import 'package:flutter/material.dart';

import '../AppManager/ThemeColor.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: (height ?? 0),
          minWidth: (width ?? 0),
        ),
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: (width ?? 0),
          height: (height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll8:
        return EdgeInsets.all(8);
      case IconButtonPadding.PaddingAll15:
        return EdgeInsets.all(15);
      case IconButtonPadding.PaddingAll2:
        return EdgeInsets.all(
          2,
        );
      case IconButtonPadding.PaddingAll5:
        return EdgeInsets.all(
          5,
        );
      default:
        return EdgeInsets.all(
          12,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA700:
        return AppColor.whiteA7004c;
      case IconButtonVariant.FillLightblue801:
        return AppColor.lightBlue801;
      case IconButtonVariant.FillLightblue802:
        return AppColor.lightBlue802;
      case IconButtonVariant.FillBlueA200:
        return AppColor.blueA200;
      case IconButtonVariant.FillGray100:
        return AppColor.gray100;
      case IconButtonVariant.OutlineWhiteA701:
      case IconButtonVariant.OutlineWhiteA7001_2:
      case IconButtonVariant.GradientLightblue800Blue500:
        return null;
      default:
        return AppColor.whiteA700;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA700:
        return Border.all(
          color: AppColor.whiteA700,
          width: (2.00),
        );
      case IconButtonVariant.OutlineWhiteA701:
        return Border.all(
          color: AppColor.whiteA701,
          width: (1.00),
        );
      case IconButtonVariant.OutlineWhiteA7001_2:
        return Border.all(
          color: AppColor.whiteA700,
          width: (1.00),
        );
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillLightblue801:
      case IconButtonVariant.GradientLightblue800Blue500:
      case IconButtonVariant.FillLightblue802:
      case IconButtonVariant.FillBlueA200:
      case IconButtonVariant.FillGray100:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder34:
        return BorderRadius.circular(
          (34.00),
        );
      case IconButtonShape.CircleBorder22:
        return BorderRadius.circular(
          (22.00),
        );
      case IconButtonShape.CircleBorder15:
        return BorderRadius.circular(
          (15.00),
        );
      case IconButtonShape.CircleBorder6:
        return BorderRadius.circular(
          (6.03),
        );
      case IconButtonShape.RoundedBorder24:
        return BorderRadius.circular(
          (24.00),
        );
      default:
        return BorderRadius.circular(
          (12.00),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.GradientLightblue800Blue500:
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
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.OutlineWhiteA700:
      case IconButtonVariant.OutlineWhiteA701:
      case IconButtonVariant.OutlineWhiteA7001_2:
      case IconButtonVariant.FillLightblue801:
      case IconButtonVariant.FillLightblue802:
      case IconButtonVariant.FillBlueA200:
      case IconButtonVariant.FillGray100:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder34,
  CircleBorder22,
  CircleBorder15,
  CircleBorder6,
  RoundedBorder24,
}

enum IconButtonPadding {
  PaddingAll12,
  PaddingAll8,
  PaddingAll15,
  PaddingAll2,
  PaddingAll5,
}

enum IconButtonVariant {
  FillWhiteA700,
  OutlineWhiteA700,
  OutlineWhiteA701,
  OutlineWhiteA7001_2,
  FillLightblue801,
  GradientLightblue800Blue500,
  FillLightblue802,
  FillBlueA200,
  FillGray100,
}
