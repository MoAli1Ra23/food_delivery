 import 'package:food_delivery/features/user_managment/domain/entites/user.dart';

abstract class IProfManagement{
  
  Future<int> addUser(User user);
  Future<User> getusrtbyfbId(String fpId);
  Future<User> getusrtbyid(int int);
 }