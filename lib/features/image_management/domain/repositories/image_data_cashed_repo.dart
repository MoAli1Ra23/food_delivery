import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/error/failuer.dart';
import '../entities/image_cashed_data.dart';
abstract class ImageDataCasheRepo{
  /// cashs imagedate to db 
  Future<Either<Failure, ImageCashedData>>cashImage(ImageCashedData imageCashedData);
  ///to get ImageCashedData where its url == url
  ///return eithe Failure if it is an error
  ///or ImageCashedData 
  ///parm is url 
  Future<Either<Failure,ImageCashedData >>getImageCashedDataByURL( String url);

}