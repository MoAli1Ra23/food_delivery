import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/image_management/view/bloc/manage_image_bloc.dart';
import 'package:food_delivery/features/image_management/view/widgets/manage_image_widget.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/features/user_managment/view/bloc/profile_bloc_bloc.dart';

import '../../../restraunt_management/view/bloc/create_restrunt_bloc.dart';
import '../../../restraunt_management/view/pages/create_resturnt_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
          builder: (context, state) {
            if (state is ProfileBlocLaoded) {
              return Column(
                children: [
                  BlocProvider(
                    create: (context) => ManageImageBloc()
                      ..add(ImageSettingEvent(
                          collction: "",
                          imageSorce: ImageSource.camera,
                          tempImage: const Image(
                              image: AssetImage(
                                  'assets/images/bestfood/bf3.jpeg')),
                          url: state.image)),
                    child: const ManageImageWidget(),
                  ),

                  // image(state, context),
                  Text(
                    state.mail!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    state.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (state.fbID == null) return;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return BlocProvider(
                            create: (context) => CreateRestruntBloc()
                              ..add(CreateRestruntUserIDChanaged(state.fbID!)),
                            child: CreateRestrunPage(),
                          );
                        }));
                      },
                      child: const Text("add restrun"))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
          },
        ));
  }

  Widget image(ProfileBlocLaoded state, BuildContext context) {
    onTab() async {
      final ImagePicker _picker = ImagePicker();

      final img = await _picker.pickImage(source: ImageSource.camera);
      if (img != null) {
        BlocProvider.of<ProfileBlocBloc>(context)
            .add(ProfileBlocUpdateImage(File(img.path)));
      }
    }

    if (state.image == null) {
      return InkWell(
          onTap: onTab,
          child:
              const Image(image: AssetImage('assets/images/auth/noimg.png')));
    } else if (state.image!.contains("/data/user/")) {
      return InkWell(
        onTap: onTab,
        child: Image(
          image: FileImage(
            File(state.image!),
          ),
        ),
      );
    } else {
      return InkWell(
          onTap: onTab, child: Image(image: NetworkImage(state.image!)));
    }
  }
}
