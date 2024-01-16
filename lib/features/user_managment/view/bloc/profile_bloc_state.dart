// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocState extends Equatable {
  const ProfileBlocState({ required this.fbID, required this.name,required  this.mail, required this.image});
  final String? name;
  final String? mail;
  final String? image; 
  final String? fbID; 
   
  @override
  List<Object?> get props => [mail, name, image,fbID];


  ProfileBlocState copyWith({
    String? name,
    String? mail,
    String? image ,
    String? fbID
  });
}

final class ProfileBlocInitial extends ProfileBlocState {
  const ProfileBlocInitial({required super.fbID, required super.name, required super.mail, required super.image});

  @override
  ProfileBlocState copyWith({String? name, String? mail, String? image ,String? fbID })  {
    return ProfileBlocInitial(
     name: name ?? this.name,
     mail: mail ?? this.mail,
     image: image ?? this.image,
      fbID : fbID ?? this.fbID,
    );
  }}
  
final class ProfileBlocLoading extends ProfileBlocState {
  const ProfileBlocLoading({required super.name, required super.mail, required super.image, required super.fbID});

  
  @override
  ProfileBlocState copyWith({String? name, String? mail, String? image ,String? fbID })  {
    return ProfileBlocLoading(
     name: name ?? this.name,
     mail: mail ?? this.mail,
     image: image ?? this.image,
      fbID : fbID ?? this.fbID,
    );
  }}

final class ProfileBlocLaoded extends ProfileBlocState {
  const ProfileBlocLaoded({required super.name, required super.mail, required super.image, required super.fbID});

  @override
  ProfileBlocState copyWith({String? name, String? mail, String? image ,String? fbID })  {
    return ProfileBlocLaoded(
     name: name ?? this.name,
     mail: mail ?? this.mail,
     image: image ?? this.image,
      fbID : fbID ?? this.fbID,
    );
  }}
  class ProfileStateSingOut extends ProfileBlocState{
  ProfileStateSingOut({required super.fbID, required super.name, required super.mail, required super.image});

  @override
  ProfileBlocState copyWith({String? name, String? mail, String? image, String? fbID}) {
     throw UnimplementedError();
  }
  }

