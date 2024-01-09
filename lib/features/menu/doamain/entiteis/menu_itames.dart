// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final String? imgUrl;
  final String dissName;
  final String discraption;
  final double price;
  final double? rate;
  const MenuItem({
    required this.imgUrl,
    required this.dissName,
    required this.discraption,
    required this.price,
    this.rate,
  });


  MenuItem copyWith({
    String? imgUrl,
    String? dissName,
    String? discraption,
    double? price,
    double? rate,
  }) {
    return MenuItem(
      imgUrl: imgUrl ?? this.imgUrl,
      dissName: dissName ?? this.dissName,
      discraption: discraption ?? this.discraption,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgUrl': imgUrl,
      'dissName': dissName,
      'discraption': discraption,
      'price': price,
      'rate': rate,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      imgUrl: map['imgUrl'] as String,
      dissName: map['dissName'] as String,
      discraption: map['discraption'] as String,
      price: map['price'] as double,
      rate: map['rate'] != null ? map['rate'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItem.fromJson(String source) => MenuItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      imgUrl,
      dissName,
      discraption,
      price,
      rate,
    ];
  }
}
