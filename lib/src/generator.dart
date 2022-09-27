import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_generator_kosmos/src/model/field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_kosmos_v4/ui_kosmos_v4.dart';
import 'package:core_kosmos/core_kosmos.dart';

abstract class FormGenerator {
  static Widget generateField(
    BuildContext context,
    FieldFormModel field, {
    TextEditingController? controller,
    FocusNode? actual,
    FocusNode? next,
    void Function(dynamic)? onChanged,
  }) {
    switch (field.type) {
      case FormFieldType.text:
        return TextFormUpdated.classic(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          onChanged: field.onChanged ?? onChanged,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          focusNode: actual,
          nextFocusNode: next,
          textInputType: TextInputType.text,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          defaultValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.email:
        return TextFormUpdated.classic(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onChanged: field.onChanged ?? onChanged,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          focusNode: actual,
          nextFocusNode: next,
          textInputType: TextInputType.emailAddress,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          defaultValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.textArea:
        return TextFormUpdated.textarea(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onChanged: field.onChanged ?? onChanged,
          controller: controller,
          focusNode: actual,
          nextFocusNode: next,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding,
          maxLine: field.theme?.maxLine,
          minLine: field.theme?.minLine,
          initialValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.password:
        return TextFormUpdated.classic(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onChanged: field.onChanged ?? onChanged,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          focusNode: actual,
          obscuringText: true,
          nextFocusNode: next,
          textInputType: TextInputType.visiblePassword,
          backgroundColor: field.theme?.backgroundColor,
          isUpdatable: true,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          suffixChild: const Icon(Icons.remove_red_eye_outlined),
          suffixChildActive: const Icon(Icons.remove_red_eye),
          defaultValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.date:
        return TextFormUpdated.dateTime(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onChangedDate: field.onChanged ?? onChanged,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          focusNode: actual,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          nextFocusNode: next,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          defaultDate: field.initialValue,
          validatorDate: (DateTime? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.dropdown:
        return SelectForm(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onChangedSelect: field.onChanged ?? onChanged,
          backgroundColor: field.theme?.backgroundColor,
          contentPadding: field.theme?.contentPadding,
          value: field.initialValue,
          items: field.dropdownItems,
        );
      case FormFieldType.numberplate:
        return TextFormUpdated.immatriculation(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          fieldPostRedirection: field.suffix,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          postFieldOnClick: field.onTapSuffix,
          hintTextStyle: field.theme?.hintStyle,
          onChanged: field.onChanged ?? onChanged,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          focusNode: actual,
          nextFocusNode: next,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          defaultValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
      case FormFieldType.image:
        return Input.image(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          onChanged: field.onChanged ?? onChanged,
          defaultFile: field.initialValue,
          onTap: () async {
            if (kIsWeb) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png'],
              );
              if (field.onChanged != null) {
                field.onChanged!(result?.files.single);
              } else if (onChanged != null) {
                onChanged(result?.files.single);
              }
            } else {
              final ImagePicker _picker = ImagePicker();
              final XFile? image = await _picker.pickImage(source: ImageSource.camera);
              if (field.onChanged != null) {
                field.onChanged!(image);
              } else if (onChanged != null) {
                onChanged(image);
              }
            }
          },
          child: field.child,
        );
      case FormFieldType.imageMultiple:
        return Input.image(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          onChanged: field.onChanged ?? onChanged,
          // child: ,
          defaultFile: field.initialValue,
        ); //TODO mulitple image
      case FormFieldType.file:
        return Input.files(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          onMultipleChanged: field.onChanged ?? onChanged,
          defaultFileList: field.initialValue,
        );
      case FormFieldType.slide:
        return CustomSlider.slider(
          min: field.sliderMinValue,
          max: field.sliderMaxValue,
          onChanged: field.onChanged ?? onChanged,
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          value: ((field.initialValue ?? field.sliderMinValue) as num).toDouble(),
        );
      case FormFieldType.range:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: formatWidth(20)),
          child: CustomSlider.range(
            min: field.sliderMinValue,
            max: field.sliderMaxValue,
            onChanged: field.onChanged ?? onChanged,
            fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
            fieldNameStyle: field.theme?.fieldStyle,
            rangeValue: field.initialValue,
          ),
        );
      case FormFieldType.checker:
        return Selector(
          content: field.fieldName,
          onChanged: field.onChanged ?? onChanged,
          defaultChecked: field.initialValue ?? false,
        );
      case FormFieldType.phone:
        return TextFormUpdated.phoneNumber(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          onInputChanged: field.onChanged ?? onChanged,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          focusNode: actual,
          nextFocusNode: next,
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          initialPhoneValue: field.initialValue,
        );
      case FormFieldType.number:
        return TextFormUpdated.classic(
          fieldName: "${field.fieldName ?? ""}${field.requiredForForm ? "*" : ""}",
          fieldNameStyle: field.theme?.fieldStyle,
          hintText: field.placeholder,
          hintTextStyle: field.theme?.hintStyle,
          fieldPostRedirectionStyle: field.theme?.fieldPostRedirectionStyle,
          onChanged: field.onChanged ?? onChanged,
          fieldPostRedirection: field.suffix,
          postFieldOnClick: field.onTapSuffix,
          textInputAction: next != null ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          focusNode: actual,
          nextFocusNode: next,
          textInputType: const TextInputType.numberWithOptions(),
          backgroundColor: field.theme?.backgroundColor,
          cursorColor: field.theme?.cursorColor,
          contentPadding: field.theme?.contentPadding as EdgeInsets?,
          defaultValue: field.initialValue,
          validator: (String? val) {
            if (field.validator != null) return field.validator!(val);
            return null;
          },
        );
    }
  }

  static Form generateForm(
    BuildContext context, {
    GlobalKey<FormState>? key,
    required List<FieldFormModel> fields,
    List<FocusNode>? nodes,
    List<TextEditingController>? controllers,
  }) {
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...fields.map(
            (e) {
              final index = fields.indexOf(e);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  generateField(
                    context,
                    e,
                    controller: controllers != null && controllers.length >= index ? controllers[index] : null,
                    actual: nodes != null && nodes.length > index ? nodes[index] : null,
                    next: nodes != null && nodes.length > index + 1 ? nodes[index + 1] : null,
                  ),
                  sh(10),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
