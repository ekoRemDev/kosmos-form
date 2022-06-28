import 'package:flutter/material.dart';
import 'package:ui_kosmos_v4/form/theme.dart';

enum FormFieldType {
  /// default
  text,
  email,
  textArea,

  /// security
  password,

  ///misc
  date,
  dropdown,
  numberplate,
  image,
  imageMultiple,
  file,
  slide,
  range,
  checker,
}

class FieldModel {
  final String tag;
  final FormFieldType type;
  final String? placeholder;
  final String? fieldName;
  final String? Function(dynamic)? validator;

  const FieldModel({
    required this.tag,
    required this.type,
    this.fieldName,
    this.placeholder,
    this.validator,
  });
}

class FieldFormModel {
  final String tag;
  final FormFieldType type;
  final String? Function(dynamic)? validator;
  final String? placeholder;
  final String? fieldName;
  final dynamic initialValue;
  final VoidCallback? onTapSuffix;
  final String? suffix;
  final CustomFormFieldThemeData? theme;
  final void Function(dynamic)? onChanged;

  /// authorizations
  final bool requiredForForm;
  final bool requiredForNextStep;

  ///Slider
  final double sliderMinValue;
  final double sliderMaxValue;

  const FieldFormModel({
    required this.tag,
    this.type = FormFieldType.text,
    this.validator,
    this.fieldName,
    this.placeholder,
    this.initialValue,
    this.suffix,
    this.onTapSuffix,
    this.theme,
    this.onChanged,

    ///authorizations
    this.requiredForNextStep = true,
    this.requiredForForm = false,

    ///Slider
    this.sliderMinValue = 0,
    this.sliderMaxValue = 100,
  }) : assert(sliderMinValue < sliderMaxValue);
}
