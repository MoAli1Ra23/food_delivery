// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBoutton extends StatelessWidget {
  const CustomBoutton({
    Key? key,
    this.onTab,
      this.height,
      this.width,
   required this.text,
      this.textStyle,
  }) : super(key: key);
  final Function()? onTab;
  final double? height;
  final double? width;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: height?? 60,
        width: width?? 160,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 193, 193),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 3))
            ]),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
        ),
      ),
    );
  }
}
