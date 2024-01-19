import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

@module
abstract class Storage {
  @Injectable(env: ['prod', 'debug'])
  FirebaseStorage get storage => FirebaseStorage.instance;
}
@module
abstract class Connections {
  @Injectable(env: ['prod', 'debug'])
  Connectivity get connection => Connectivity();
}
