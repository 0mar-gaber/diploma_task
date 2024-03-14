import 'package:flutter/material.dart';
typedef Validate = String? Function(String?)?;

class EditText extends StatelessWidget {
  final String lapel;
  final bool obscureText;
  final IconButton? iconButton;
  final TextInputType keyboardType;
  final GlobalKey<FormState> formKay;
  final Validate validate;
  final TextEditingController controller;

  const EditText({
    super.key,
    required this.lapel,
    required this.obscureText,
    this.iconButton,
    required this.keyboardType,
    required this.formKay,
    this.validate,
    required this.controller,});


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      validator: validate,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: width * 0.03,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      cursorColor: const Color.fromRGBO(0, 65, 130, 1.0),
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
        filled: true,
        errorStyle: const TextStyle(color: Colors.red), // Set the color of the error message text to red

        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(width * 0.024),
        labelText: lapel,
        suffixIcon: iconButton,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(0, 65, 130, 1.0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
