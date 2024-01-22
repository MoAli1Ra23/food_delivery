import 'package:firebase_auth/firebase_auth.dart' as fire;

import '../../domain/entites/user.dart';

class UserMapper {
  static User getUserFromFireBaseUser(fire.User a) {
    var user =
        User(name: a.displayName, mail: a.email, uid: a.uid, image: a.photoURL);
        return user;
  }
  static User getUserFromFireBaseUserCredential(fire.UserCredential credential) {
    fire.User? a=credential.user;
   return getUserFromFireBaseUser(a!);

   
  }
  
}
