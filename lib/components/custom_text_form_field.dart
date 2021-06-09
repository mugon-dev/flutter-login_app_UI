import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String subtitle;
  final Function scrollAnimate;
  const CustomTextFormField(this.subtitle, this.scrollAnimate, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitle),
        SizedBox(height: 5),
        TextFormField(
          onTap: () {
            scrollAnimate();
          },
          validator: (value) =>
              value!.isEmpty ? "Please Enter some text" : null,
          decoration: InputDecoration(
            hintText: "Enter $subtitle",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
