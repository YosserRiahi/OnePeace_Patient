part of formwidget;

class EmailForm extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const EmailForm({
    required this.controller,
    required this.onEditingComplete,
    required this.validator,
    required this.onsave,
    required this.onchange,
    required this.focusnode,
  });
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final String? Function(String?) validator;
  final void Function(String?) onsave;
  final void Function(String?) onchange;
  final FocusNode focusnode;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TextFormField(
        controller: controller,
        focusNode: focusnode,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        onEditingComplete: onEditingComplete,
        onChanged: onchange,
        onSaved: onsave,
        validator: validator,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/icons/Mail.svg',
              width: 5,
              height: 5,
            ),
          ),
          hintText: "exemple@email.com",
          hintStyle: Theme.of(context).textTheme.bodyText2,
          filled: true,
          fillColor: Colors.grey.shade100.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
