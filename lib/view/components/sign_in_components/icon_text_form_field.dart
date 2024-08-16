import 'package:flutter/material.dart';

class IconTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final bool isRequired;
  final FormFieldValidator<String>? validator;

  const IconTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: labelText,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              // children: [
              //   if (isRequired)
              //     const TextSpan(
              //       text: ' *',
              //       style: TextStyle(color: Colors.red),
              //     ),
              // ],
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon),
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            keyboardType: keyboardType,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
