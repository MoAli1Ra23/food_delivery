import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/user_managment/domain/entites/user.dart';

import '../../../../shared/error/failuer.dart';

abstract class IProfManagement {
  Future<Option<Failure>> addUser(User user);
  Future<User> getusrtbyfbId(String fpId);
  Future<User> getusrtbyid(int int);

  Future<String?> getProfileImage(String path);
  Future<String?> setProfileImage({String? fbID, required File img});
  Future<String?> updateImagPathInUserDocViafbid(String fbId, String imgPath);
}
