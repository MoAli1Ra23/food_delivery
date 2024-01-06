 import 'dart:io';

import 'package:food_delivery/features/user_managment/domain/entites/user.dart';

abstract class IProfManagement{
  
  Future<int> addUser(User user);
  Future<User> getusrtbyfbId(String fpId);
  Future<User> getusrtbyid(int int);
  Future<String?> getProfileImage(String path);
  Future<String?> setProfileImage(String fbID,File img);
  Future<String?> updateImagPathInUserDocViafbid(String fbId,String imgPath);
 }