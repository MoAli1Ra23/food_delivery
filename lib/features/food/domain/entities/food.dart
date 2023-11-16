// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final int id;
  final String name;
  final String imagepath;

  const Food({
    required this.id,
    required this.name,
    required this.imagepath,
  });

  @override
  List<Object> get props => [id, name, imagepath];

  Food copyWith({
    int? id,
    String? name,
    String? imagepath,
  }) {
    return Food(
      id: id ?? this.id,
      name:name ?? this.name,
      imagepath:imagepath ?? this.imagepath,
    );
  }
}
