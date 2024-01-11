import 'dart:io';
  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/menu/doamain/entiteis/menu_itames.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';
import '../../../../shared/overapp/fire_store.dart';
import '../../../../shared/overapp/image_uploeder.dart';
import '../../doamain/repositories/menu_items_repo.dart';

@LazySingleton(as: MenuitemsRepo, env: ['prod', 'debug'])
class MenuItemRepoImpl extends MenuitemsRepo {
  @override
  Future<Either<Failure, Unit>> deleteItem(MenuItem item, String restruntId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MenuItem>> fetchItemsByMenuId(String menuId) {
    throw UnimplementedError();
  }
  /// تدخل   عناصر  الي 
  /// 
  /// 
  /// itams
  /// Throw[Failure] if failu
  
  @override
  Future<Either<Failure, Unit>> insertItems(
      List<MenuItem> items) async {
    // var fire = getIt.get<FirebaseFirestore>();
    // var restrauntref = fire.collection('Restraunts').doc();
    // DocumentSnapshot restraunt = await restrauntref.get();
    
      try {
      print('++++++++++++++++++++++++++++++');
      print('+++++++++Start loop+++++++++++');
      print('++++++++++++++++++++++++++++++');
        for (var ee in items) {
          await insertItemInACollectinio(ee.toMap(),"itams").then((value) => print(value));
          // await fire.collection("itams").add(ee.toMap()).then((value) => 
          // print(value));
        }
      } catch (e) {
        print(e.toString());
        return left(Failure(""));

      }
      return right(unit);
    
  }

  @override
  Future<Either<Failure, Unit>> updateItem(MenuItem item, String restruntId) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

///upload image to 
  @override
  Future<Either<Failure, String>> uplodeImage(File item) {
    return uplodeImageAndGetURL(file: item, floder: "image/food");
  }

  @override
  Future<Either<Failure, List<MenuItem>>> fetchItems() async {
    try {
      List<MenuItem> mil = [];
      var x = getIt.get<FirebaseFirestore>();
   var re =
          await x.collection("itams").get().then((value) => value);
      if (re.docs.isEmpty) {
        print("np ele");
        return right([]);
      }
      for (var element in re.docs.toList()) {
        mil.add(MenuItem.fromMap(element.data()));
        print(element);
      }
      return Right(mil);
    } catch (e) {
      print(e);
      return Left(Failure(e.toString()));
    }
  }
}
