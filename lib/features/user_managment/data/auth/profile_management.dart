import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/features/user_managment/domain/entites/user.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/i_prof_managemant.dart';

@Singleton(as: IProfManagement, env: ['prod', 'debug'])
class ProfileManagement extends IProfManagement {
  @override
  Future<int> addUser(User user) async {
    int r = 0;

    /// to be tested
    /// todo: edit
    var x = getIt.get<FirebaseFirestore>();
    CollectionReference users = x.collection('users');
    await users.add(user.toMap()).then((value) {
      r = 1;
      print("qeee addd");
    });
    return r;
  }

  @override
  Future<User> getusrtbyfbId(String fpId) async {
    // todo: optimze it
    var x = getIt.get<FirebaseFirestore>();
    CollectionReference users = x.collection('users');
    QuerySnapshot? m =
        await users.where("fbID", isEqualTo: fpId).get().then((value) => value);
    return User.fromMap(m!.docs.first.data() as Map<String, dynamic>);
  }

  @override
  Future<User> getusrtbyid(int int) {
    // TODO: implement getusrtbyid
    throw UnimplementedError();
  }

  @override
  Future<String?> getProfileImage(String path) {
     throw UnimplementedError();
  }

  @override
  Future<String?> setProfileImage(String fpId, File img) async {
    FirebaseStorage storage = getIt.get<FirebaseStorage>();
    Reference ref = storage.ref().child('images').child("$fpId/");
    File f =File("${img.path}.jpg");
    TaskSnapshot x = await ref
        .putFile(
          f,
        )
        .then((p0) => p0);
    return x.ref.getDownloadURL();
  }
}
