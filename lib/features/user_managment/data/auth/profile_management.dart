import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/user_managment/domain/entites/user.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/i_prof_managemant.dart';
@Singleton(as: IProfManagement, env: ['prod','debug'])
class ProfileManagement extends IProfManagement {
  @override
  Future<int> addUser(User user) async {
    int r =0;
    /// to be tested
    /// todo: edit
    var x= getIt.get<FirebaseFirestore>();
    CollectionReference users= x.collection('users');
    await users.add(user.toMap()).then((value) {
      r=1;
      print("qeee addd");
    });
    return r;
    
    
   }

  @override
  Future<User> getusrtbyfbId(String fpId) {
    // TODO: implement getusrtbyfbId
    throw UnimplementedError();
  }

  @override
  Future<User> getusrtbyid(int int) {
    // TODO: implement getusrtbyid
    throw UnimplementedError();
  }
  
}