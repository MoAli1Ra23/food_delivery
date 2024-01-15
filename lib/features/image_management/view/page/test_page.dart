import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/image_management/view/bloc/manage_image_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/manage_image_widget.dart';

class PageforTest extends StatelessWidget {
  const PageforTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageImageBloc()
        ..add(  const ImageSettingEvent(collction: "", imageSorce: ImageSource.camera,tempImage: Image(image: AssetImage('assets/images/bestfood/bf3.jpeg')))),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ManageImageWidget(),
        ),
      ),
    );
  }
}
