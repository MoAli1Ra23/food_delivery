// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocState extends Equatable {
  const ProfileBlocState({required this.name,required  this.mail});
  final String? name;
  final String? mail;
  @override
  List<Object?> get props => [mail, name];


  ProfileBlocState copyWith({
    String? name,
    String? mail,
  });
}

final class ProfileBlocInitial extends ProfileBlocState {
  const ProfileBlocInitial({required super.name, required super.mail});

  @override
  ProfileBlocState copyWith({String? name, String? mail})  {
    return ProfileBlocInitial(
     name: name ?? this.name,
     mail: mail ?? this.mail,
    );
  }}
  
final class ProfileBlocLoading extends ProfileBlocState {
  const ProfileBlocLoading({required super.name, required super.mail});

  @override
  ProfileBlocState copyWith({String? name, String? mail})  {
    return ProfileBlocLoading(
     name: name ?? this.name,
     mail: mail ?? this.mail,
    );
  }}

final class ProfileBlocLaoded extends ProfileBlocState {
  const ProfileBlocLaoded({required super.name, required super.mail});

  @override
  ProfileBlocState copyWith({String? name, String? mail})  {
    return ProfileBlocLaoded(
     name: name ?? this.name,
     mail: mail ?? this.mail,
    );
  }}

