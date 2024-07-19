// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  final ValueChanged<String> onSubmitted;

  SearchBar({
    Key? key,
    required this.controller,
    this.hintText = "Where are you going? ",
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFC8C7CC),
            fontSize: 17,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              'assets/images/search.png',
              width: 25,
              height: 25,
              color: Colors.blueGrey,
            ),
            onPressed: () => onSubmitted(controller.text),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }
}
