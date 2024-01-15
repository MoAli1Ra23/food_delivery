// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'manage_image_bloc.dart';

sealed class ManageImageState extends Equatable {
  const ManageImageState();

  @override
  List<Object?> get props => [];
}

class ManageImageInitial extends ManageImageState {
  final String pathInTheCloud;
  final ImageSource? imageSorce;
  final File? img;
  final Image? tempImage;
  final String? url;
  const ManageImageInitial({
    required this.pathInTheCloud,
    required this.imageSorce,
    required this.tempImage,
    this.img,
    this.url,
  });

  @override
  List<Object?> get props => [pathInTheCloud, imageSorce, tempImage,img, url];

  ManageImageInitial copyWith({
    String? pathInTheCloud,
    ImageSource? imageSorce,
    File? img,
    Image? tempImage,
    String? url,
  }) {
    return ManageImageInitial(
      pathInTheCloud: pathInTheCloud ?? this.pathInTheCloud,
      imageSorce: imageSorce ?? this.imageSorce,
      img: img ?? this.img,
      tempImage: tempImage ?? this.tempImage,
      url: url ?? this.url,
    );
  }
}

class UplodingImage extends ManageImageState {
  final File? img;
  const UplodingImage({
    this.img,
  });

  UplodingImage copyWith({
    File? img,
  }) {
    return UplodingImage(
      img: img ?? this.img,
    );
  }

  @override
  List<Object?> get props => [img];
}

class UplodingImageFailure extends ManageImageState {
  final String? errorImagePath;
  final Failure failure;
  final File? img;
  const UplodingImageFailure({
    this.errorImagePath,
    required this.failure,
    this.img,
  });

  UplodingImageFailure copyWith({
    String? errorImagePath,
    File? img,
    Failure? failure,
  }) {
    return UplodingImageFailure(
      errorImagePath: errorImagePath ?? this.errorImagePath,
      img: img ?? this.img,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [img, errorImagePath];
}

class UplodingImageSucces extends ManageImageState {
   final String path;
  const UplodingImageSucces({
    required this.path,
  });

  UplodingImageSucces copyWith({
    String? path,
  }) {
    return UplodingImageSucces(
      path: path ?? this.path,
    );
  }

  @override
  List<Object> get props => [path];
}
