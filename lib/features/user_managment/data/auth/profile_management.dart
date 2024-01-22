import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/features/user_managment/domain/entites/user.dart';
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/error/failuer.dart';
import '../../domain/repository/i_prof_managemant.dart';

@Singleton(as: IProfManagement, env: ['prod', 'debug'])
class ProfileManagement extends IProfManagement {
  @override
  Future<Option<Failure>> addUser(User user) async {
    try {
      int r = 0;

      /// to be tested
      /// todo: edit
      var x = getIt.get<FirebaseFirestore>();
      CollectionReference users = x.collection('users');
      return await users.add(user.toMap()).then((value) {
        print("adddddddddddddddddd");
        return none();
      });
    } catch (e) {
      return Some(Failure(""));
    }
  }

  @override
  Future<User> getusrtbyfbId(String fpId) async {
   var xx  = await getIt.get<IAuthFacade>().checkAuthState();
   User? u;
   xx.fold((l) => null, (r) => u=r);
   print(u!.type);
   
   return u!;

    // todo: optimze it
    // var x = getIt.get<FirebaseFirestore>();
    // CollectionReference users = x.collection('users');
    // QuerySnapshot? m =
    //     await users.where("fbID", isEqualTo: fpId).get().then((value) => value);
    // return User.fromMap(m!.docs.first.data() as Map<String, dynamic>);
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
  Future<String?> setProfileImage({String? fbID, required File img}) async {
    try {
      FirebaseStorage storage = getIt.get<FirebaseStorage>();

      Reference ref = storage.ref().child('images/Users');

      String ts = DateTime.now().millisecondsSinceEpoch.toString();
      var downloadUR = await ref
          .child("$ts.jpg")
          .putFile(img)
          .then((p0) async => await p0.ref.getDownloadURL());

      // var downloadUR = await ref.getDownloadURL();
      print("downloadUR:$downloadUR >>>>>>>>>>>>>>>");
      return downloadUR;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<String?> updateImagPathInUserDocViafbid(
      String fbID, String imgPath) async {
    FirebaseFirestore store = getIt.get<FirebaseFirestore>();
    CollectionReference users = store.collection("users");
    QuerySnapshot querySnapshot =
        await users.where(FieldPath.fromString("fbID"), isEqualTo: fbID).get();

    // Map<String, dynamic> ud = {'image': imgPath};
    try {
      if (querySnapshot.docs.isNotEmpty) {
        var dd = users.doc(querySnapshot.docs.first.id);

        await users.doc(querySnapshot.docs.first.id).update({'image': imgPath});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Option<Failure>> updateUserProfile(User user) {
     throw UnimplementedError();
  }
}
