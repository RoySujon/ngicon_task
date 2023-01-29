import 'package:flutter/material.dart';

import 'const.dart';

class CustomTextField extends StatelessWidget {
  final String? hints, title;
  final int? maxLine, maxLength;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hints,
    this.title,
    this.maxLine,
    required this.controller,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heaingText('${title ?? 'Title'}', fontSize: 18),
              Text(':'),
            ],
          ),
        ),
        sboxW8,
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: maxLine,
            minLines: maxLine,
            maxLength: maxLength,
            decoration: InputDecoration(
                // alignLabelWithHint: true,
                hintText: 'Enter ${hints ?? 'hints..'}',
                hintStyle: TextStyle(color: kLabel, fontSize: 14),
                filled: true,
                fillColor: kMain2),
          ),
        ),
      ],
    );
  }
}
