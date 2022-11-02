import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormComponent extends StatelessWidget {
  const FormComponent({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.onEditingComplete,
    required this.onchange,
    required this.onSave,
    required this.validator,
    required this.title,
    required this.hinttext,
    required this.child,
    required this.keyboardType,
  }) : super(key: key);
  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function() onEditingComplete;
  final void Function(String?) onchange;
  final void Function(String?) onSave;
  final String? Function(String?) validator;
  final String title;
  final String hinttext;
  final Widget child;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        onChanged: onchange,
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: child,
          ),
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          filled: true,
          fillColor: Colors.grey.shade50.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
