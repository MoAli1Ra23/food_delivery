// ignore_for_file: public_member_api_docs, sort_constructors_first
 
 import 'package:hive_flutter/hive_flutter.dart';
part 'image_cashed_data.g.dart'; 

@HiveType(typeId: 0)
class ImageCashedData extends HiveObject{
  /// to hold downlaod  link
  /// in firebase Storage
  ///
  @HiveField(0)

  final String url;

  /// to hold Cashed path in local Device
  @HiveField(1)

  final String path;

    ImageCashedData({
    required this.url,
    required this.path,
  });
 }
