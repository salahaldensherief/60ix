part of '../buttons.dart';

abstract class ButtonStyleConfig {
  Color get backgroundColor;

  Color get disabledColor;

  TextStyle get textStyle;

  double get borderRadius;

  double? get width;

  double get height;

  EdgeInsets get padding;

  EdgeInsets get margin;

  bool get isOutlined;
}

abstract class ButtonAnimationConfig {
  Color get loadingColor;

  Duration get animationDuration;
}

class ButtonConfig implements ButtonStyleConfig, ButtonAnimationConfig {
  @override
  final Color backgroundColor;
  @override
  final Color disabledColor;
  @override
  final TextStyle textStyle;
  @override
  final double borderRadius;
  @override
  final double? width;
  @override
  final double height;
  @override
  final EdgeInsets padding;
  @override
  final EdgeInsets margin;
  @override
  final Color loadingColor;
  @override
  final Duration animationDuration;
  @override
  final bool isOutlined;

  ButtonConfig({
    this.backgroundColor = AppColors.primary,
    this.disabledColor = AppColors.disableButton,
    TextStyle? textStyle,
    this.borderRadius = 12.0,
    this.width,
    this.height = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = EdgeInsets.zero,
    this.loadingColor = AppColors.white,
    this.animationDuration = const Duration(milliseconds: 200),
    this.isOutlined = false, // Default to filled button
  }) : textStyle =
           textStyle ??
           TextStyle(
             color: Colors.white,
             fontSize: 15.5.sp,
             fontWeight: FontWeight.w600,
             fontFamily: FontsManager.fontFamily,
           );

  ButtonConfig.secondary({
    Color? backgroundColor,
    this.disabledColor = AppColors.blue,
    TextStyle? textStyle,
    this.borderRadius = 12.0,
    this.width,
    this.height = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = EdgeInsets.zero,
    this.loadingColor = AppColors.primary,
    this.animationDuration = const Duration(milliseconds: 200),
    this.isOutlined = false, // Default to filled button
  }) : backgroundColor = backgroundColor ?? AppColors.primary.shade50,
       textStyle =
           textStyle ??
           TextStyle(
             color: AppColors.primary,
             fontSize: 15.5.sp,
             fontWeight: FontWeight.w600,
             fontFamily: FontsManager.fontFamily,
           );
  ButtonConfig.outlined({
    this.backgroundColor = AppColors.primary,
    this.disabledColor = AppColors.blue,
    TextStyle? textStyle,
    this.borderRadius = 12.0,
    this.width,
    this.height = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = EdgeInsets.zero,
    this.loadingColor = AppColors.primary,
    this.animationDuration = const Duration(milliseconds: 200),
    this.isOutlined = true, // Outlined variant
  }) : textStyle =
           textStyle ??
           TextStyle(
             color: AppColors.primary,
             fontSize: 15.5.sp,
             fontWeight: FontWeight.w600,
             fontFamily: FontsManager.fontFamily,
           );
}
