// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manage_image_bloc.dart';

sealed class ManageImageEvent extends Equatable {
  const ManageImageEvent();

  @override
  List<Object> get props => [];
}

/// For new Image to upload it
/// be awaire  it upload image after select  it
class ImageSelectedEvent extends ManageImageEvent {
  final String path;

  const ImageSelectedEvent(this.path);
}

/// init the bloc and add   some  prop value
///  to chek the cash if has  a local file of it . it will show it
/// or it will going to down load it 
class ImageSettingEvent extends ManageImageEvent {
  ///
  final String collction;
  final Image tempImage;
  final ImageSource imageSorce;
  final String? url;
  const ImageSettingEvent({
    required this.collction,
    required this.tempImage,
    required this.imageSorce,
      this.url,
  });
}

///  ImageUrlSetEvent set for init Bloc and  Show the Image
/// if image is not cashed it will cash it
/// and create object in local database to save its image data
class ImageUrlSetEvent extends ManageImageEvent {
  final String url;

  const ImageUrlSetEvent(this.url);
}
