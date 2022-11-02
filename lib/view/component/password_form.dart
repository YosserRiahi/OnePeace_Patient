import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.onEditingComplete,
    required this.onchange,
    required this.onSave,
    required this.validator,
    required this.ontap,
    required this.obscure,
    required this.label,
    required this.hint,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function() onEditingComplete;
  final void Function(String?) onchange;
  final void Function(String?) onSave;
  final String? Function(String?) validator;
  final VoidCallback ontap;
  final bool obscure;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onChanged: onchange,
        onSaved: onSave,
        validator: validator,
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: ontap,
              child: obscure
                  ? SvgPicture.asset(
                      'assets/icons/Lock.svg',
                      width: 5,
                      height: 5,
                    )
                  : const Icon(
                      Icons.visibility,
                      size: 20,
                    ),
            ),
          ),
          hintText: hint,
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
