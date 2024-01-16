import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/failuer.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/image_cashed_data.dart';
import '../../domain/repositories/image_data_cashed_repo.dart';
import '../../domain/repositories/image_repo.dart';

part 'manage_image_event.dart';
part 'manage_image_state.dart';

/// for 3 tasks
/// * Load Image form Web
/// * Load Image From local Cash Folder
/// * Cash Image in local Cash Folder and cash  its data
class ManageImageBloc extends Bloc<ManageImageEvent, ManageImageState> {
  ManageImageBloc()
      : super(const ManageImageInitial(
            pathInTheCloud: '',
            imageSorce: ImageSource.gallery,
            tempImage:
                Image(image: AssetImage("assets/images/bestfood/bf3.jpeg")))) {
    // on<ImageSettingEvent>((event, emit) {
    //   emit((state as ManageImageInitial).copyWith(
    //       pathInTheCloud: event.collction, imageSorce: event.imageSorce));
    // });

    /// on Select image it  upload it

    on<ImageSelectedEvent>((event, emit) async {
      Failure? ulf;
      String? url;
      var s = (state as ManageImageInitial);
      emit(UplodingImage());
      var uploderepo = getIt.get<ImageRepo>();
      print('++++++++++++++++++++++++++++');
      print('going to Upload image');
      var purl = await uploderepo.uploadeImage(
        s.img!,
        s.pathInTheCloud,
      );
      purl.fold((l) => ulf = l, (r) => url = r);
      if (ulf != null) {
        /// uploding image failure
        emit(UplodingImageFailure(
            failure: ulf!, errorImagePath: null, img: s.img));
      } else {
        var cashrepo = getIt.get<ImageDataCasheRepo>();

        var resulte = await cashrepo
            .cashImage(ImageCashedData(url: url!, path: event.path));

        ImageCashedData? icd;
        resulte.fold((l) => null, (r) => icd);
        emit(UplodingImageSucces(path: icd!.path));
      }
    });
    on<ImageSettingEvent>((event, emit) async {
      /// steps
      /// 1- check if the file is cahed => emit loading state
      /// *** a- if it is cahed  get it if exits=> emit loaded State
      /// ****b-  if not exits load it and cash it => emit loading state
      /// 2- if File not cahsed emit => loading
      ///  ===== when laod file and it exits emit loaded state
      ///
      ///

      /// case  url!= null
      ///
      if (event.url == null) {
        emit(state);
        return;
      } else {
        String? file;

        var cashrepo = getIt.get<ImageDataCasheRepo>();

        // get cashed imagedate;
        var imagedata = await cashrepo.getImageCashedDataByURL(event.url!);

        /// case file is Cashed and exit

        file = imagedata.fold((l) => null, (r) => r.path);

        ///
        if (imagedata.isRight()) {
          var b = await File(file!).exists();

          print(' file was cashed case file is Cashed and exit');
          if (b) {
            emit(UplodingImageSucces(path: file!));
          }
        } else {
          /// case file is not exits or is not Cashed
          print(' file is not Cashed or not exits');
          var g = getIt.get<ImageRepo>();
          Failure? f;

          await g
              .downloadImage(event.url!)
              .then((Either<Failure, String> value) async {
            String? path;

            value.fold((l) => f = l, (r) => path = r);
            print(path);
            print(" its down loaded");
            if (path != null) {
              emit(UplodingImageSucces(path: path!));
              ImageCashedData imageCashedData =
                  ImageCashedData(url: event.url!, path: path!);
              await cashrepo.cashImage(imageCashedData);
            }
            if (f != null) {
              emit(UplodingImageFailure(failure: f!));
            }
          });
        }
      }
    });
  }
}
