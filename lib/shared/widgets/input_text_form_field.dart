// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    Key? key,
    this.validator,
    this.onChanged,
    this.width,
    this.tkey,
    this.txthint,
    this.controller,
    this.icon,
    this.maigrtion,
  }) : super(key: key);
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final double? width;
  final GlobalKey? tkey;
  final String? txthint;
  final TextEditingController? controller;
  final Icon? icon;
  final EdgeInsetsGeometry? maigrtion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: maigrtion,
      width: width,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          color: Colors.white,
          // 01110243904
          // border: Border.all(),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Flexible(flex: 1, child: icon!),
          Flexible(
              flex: 3,
              child: TextFormField(
                  key: tkey,
                  controller: controller,
                  onChanged: onChanged,
                  validator: validator,
                  decoration: InputDecoration(
                    hintText: txthint,
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                  ),),),
        ],
      ),
    );
  }
}
