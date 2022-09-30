part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class GetProfileInfoEvent extends ProfileEvent {}

class PassChangeEvent extends ProfileEvent {
  final Pass pass;

  PassChangeEvent({required this.pass});

  @override
  List<Object> get props => [pass];
}

class UpdateEvent extends ProfileEvent {

  final Update update;

  UpdateEvent({required this.update});

  @override
  List<Object> get props => [update];
}