import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;

  final bool? isEditable;
  TextEditingController? controller;
  String errorMsg;

  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hint,
      this.isEditable = true,
      this.controller,
      this.errorMsg = "invalid field data."});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: TextFormField(
        onChanged: (v) => onChanged!(v),
        enabled: isEditable,
        validator: (value) {
          if (value!.isEmpty) {
            return errorMsg;
          }
          return null;
        },
        controller: controller,
        onSaved: (value) {
          //write logice to fetch the value of the field
        },
        decoration: InputDecoration(
            hintText: hint!, border: const OutlineInputBorder()),
      ),
    );
  }
}
