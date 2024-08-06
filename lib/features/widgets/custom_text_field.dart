import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxlines;
  final Icon? icon;


  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.maxLength,
    this.maxlines,
    this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          maxLength: maxLength,
          maxLines: maxlines,
          decoration: InputDecoration(
              hintText: 'Enter $label',
              counterText: "",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              prefixIcon: icon),
        ),
      ],
    );
  }
}
