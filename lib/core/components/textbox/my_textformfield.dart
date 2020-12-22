import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyTextFormField extends StatelessWidget {
  final Key customKey;
  final double margin;
  final double padding;
  final String initValue;
  final int maxLen;
  final bool hidden;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String labelText;
  final String hintText;
  final String helperText;
  final TextInputType keyboardType;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String counterText;
  final bool autoFocus;
  final TextEditingController textController;
  final FocusNode focusControl;
  final ValueChanged<String> onSubmit;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;
  final bool readOnly;
  final VoidCallback suffixIconPressed;

  const MyTextFormField({
    this.customKey,
    this.margin = 0,
    this.padding = 10,
    this.initValue,
    this.maxLen = 35,
    this.hidden = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.helperText,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.validator,
    this.counterText,
    this.autoFocus = false,
    this.textController,
    this.focusControl,
    this.onSubmit,
    this.readOnly = false,
    this.onEditingComplete,
    this.textInputAction,
    this.suffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        key: customKey,
        keyboardType: keyboardType,
        initialValue: initValue,
        maxLength: maxLen,
        obscureText: hidden,
        validator: validator,
        onSaved: onSaved,
        controller: textController,
        autofocus: autoFocus,
        focusNode: focusControl,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
        readOnly: readOnly,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    padding: EdgeInsets.all(16),
                    highlightColor: ApplicationConstants.SECONDARY_COLOR,
                    splashColor: ApplicationConstants.SECONDARY_COLOR,
                    icon: suffixIcon,
                    onPressed: suffixIconPressed,
                  )
                : null,
            labelText: labelText,
            hintText: hintText,
            helperText: helperText,
            counterText: counterText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            )),
      ),
    );
  }
}
