import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class AppModel {
  @Injectable(env: ['prod', 'debug'])
  FirebaseAuth get auth => FirebaseAuth.instance;
}

@module
abstract class Man {
  @Injectable(env: ['prod', 'debug'])
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
