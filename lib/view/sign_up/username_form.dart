import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserNameForm extends StatelessWidget {
  const UserNameForm({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.onEditingComplete,
    required this.onchange,
    required this.onSave,
    required this.validator,
  }) : super(key: key);
  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function() onEditingComplete;
  final void Function(String?) onchange;
  final void Function(String?) onSave;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        focusNode: focusNode,
        keyboardType: TextInputType.name,
        onEditingComplete: onEditingComplete,
        onChanged: onchange,
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          labelText: 'username',
          labelStyle: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/icons/User.svg',
              width: 5,
              height: 5,
            ),
          ),
          hintText: "username",
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
