import 'package:flutter/material.dart';

class FormValue extends StatelessWidget {
  const FormValue(
      {super.key,
      required this.controller,
      required this.onchange,
      required this.onsave,
      required this.node,
      required this.validator});

  final TextEditingController controller;
  final Function(String?) onchange;
  final Function(String?) onsave;
  final String? Function(String?) validator;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.black54,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.white54,
                blurRadius: 20,
                offset: Offset(-10, -10)),
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(15, 15),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        validator: validator,
        focusNode: node,
        onChanged: onchange,
        onSaved: onsave,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 30,
        ),
        autocorrect: false,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
