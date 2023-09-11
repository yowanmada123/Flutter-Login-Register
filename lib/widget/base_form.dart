import 'package:flutter/material.dart';

class BaseForm extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool? passwordMode;

  const BaseForm({super.key, required this.controller, required this.title, this.passwordMode, this.hintText});

  @override
  State<BaseForm> createState() => _BaseFormState();
}

class _BaseFormState extends State<BaseForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: TextField(
      style: const TextStyle(color: Colors.black, fontSize: 14),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: widget.title,
        hintText: widget.hintText ?? "",
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    ));
  }
}
