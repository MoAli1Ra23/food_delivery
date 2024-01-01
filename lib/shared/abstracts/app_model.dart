import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class AppModel {
  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;
  @injectable
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
