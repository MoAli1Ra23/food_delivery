// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final int id;
   final String name;

  const Food(this.id, this.name);


  @override
  List<Object> get props => [id, name];
}
