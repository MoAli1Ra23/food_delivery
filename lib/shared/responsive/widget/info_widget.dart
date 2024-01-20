// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/shared/responsive/divce_info.dart';

import '../func.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(BuildContext, DeviceInfo) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints,{ int grdlanrgh=250}) {
        var mediaQueryData = MediaQuery.of(context);
       var  crossAxisCount=(MediaQuery.of(context).size.width ~/ grdlanrgh).toInt();

        DeviceInfo di = DeviceInfo(
            orientation: mediaQueryData.orientation,
            deviceType: getDeviceType(mediaQueryData),
            height: mediaQueryData.size.height,
            width: mediaQueryData.size.width,
            loaclheight: constraints.maxHeight,
            localwith: constraints.maxHeight,crossAxisCount: crossAxisCount);
        return builder(context,di);
      },
    );
  }
}
