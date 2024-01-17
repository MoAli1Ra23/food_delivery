// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/shared/responsive/divece_type.dart';

class DeviceInfo {
  final Orientation orientation;
  final DeviceType deviceType;
  final double height;
  final double width;
  final double loaclheight;
  final double localwith;
  final int crossAxisCount;

  DeviceInfo({
    required this.orientation,
    required this.deviceType,
    required this.height,
    required this.width,
    required this.loaclheight,
    required this.localwith,
    required this.crossAxisCount,
  });
}
