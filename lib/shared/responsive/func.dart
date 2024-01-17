import 'package:flutter/material.dart';
import 'package:food_delivery/shared/responsive/divece_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  double w = 0;
  Orientation or = mediaQueryData.orientation;
  if (or == Orientation.landscape) {
    w = mediaQueryData.size.height;
  } else {
    w = mediaQueryData.size.width;
  }

  if (w >= 950) {
    return DeviceType.desktop;
  } else if (w >= 600) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}
