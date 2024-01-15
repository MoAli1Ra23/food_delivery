 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/image_management/view/bloc/manage_image_bloc.dart';
import 'package:food_delivery/shared/widgets/image_perviewer.dart';

class ManageImageWidget extends StatelessWidget {
  const ManageImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageImageBloc, ManageImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ManageImageInitial) {
          return SizedBox(
            height: 150,
            child: ImagePerViewer(
              source: state.imageSorce!,
              tempImage: state.tempImage!,
              onTab: (v) => BlocProvider.of<ManageImageBloc>(context)
                  .add(ImageSelectedEvent(v.path)),
            ),
          );
        } else if (state is UplodingImage) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Image.file(state.img!),
                const LinearProgressIndicator(
                  color: Colors.lightBlue,
                )
              ],
            ),
          );
        } else if (state is UplodingImageFailure) {
          return Column(children: [
            Image.file(state.img!),
            Text(state.failure.message),
          ]);
        } else {
          return Image(image: FileImage( (File((state as UplodingImageSucces).path))),fit: BoxFit.cover,);
        }
      },
    );
  }
}
