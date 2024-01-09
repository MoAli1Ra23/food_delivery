import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/menu/doamain/entiteis/menu_itames.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';
import '../../../../shared/overapp/image_uploeder.dart';
import '../../doamain/repositories/menu_items_repo.dart';

@LazySingleton(as: MenuitemsRepo, env: ['prod', 'debuge'])
class MenuItemRepoImpl extends MenuitemsRepo {
  @override
  Future<Either<Failure, Unit>> deleteItem(MenuItem item, String restruntId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MenuItem>> fetchItemsByMenuId(String menuId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> insertItems(
      List<MenuItem> items, String restruntId) async {
    var x = getIt.get<FirebaseFirestore>();
    var restrauntref = x.collection('Restraunts').doc(restruntId);
    DocumentSnapshot restraunt = await restrauntref.get();
    if (!restraunt.exists) {
      return left(Failure(""));
      //TODO :create Failure for not exits state
    } else {
      try {
        for (var ee in items) {
          await restrauntref.collection("itams").add(ee.toMap());
        }
      } catch (e) {
        return left(Failure(""));
      }
      return right(unit);
    }
  }

  @override
  Future<Either<Failure, Unit>> updateItem(MenuItem item, String restruntId) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uplodeImage(File item) {
    return uplodeImageAndGetURL(file: item, floder: "image/food");
  }
}
