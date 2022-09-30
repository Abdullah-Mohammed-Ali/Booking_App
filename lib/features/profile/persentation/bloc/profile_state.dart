part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {

  @override
  List<Object> get props => [];
}


class LoadingProfileState extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => [];


      //throw UnimplementedError();
}






class ProfileInfoState extends ProfileState{
  final Profile_Info profile_Info;

  ProfileInfoState({required this.profile_Info});

  @override
  // TODO: implement props
  List<Object?> get props => [profile_Info];


}

class PassChangeState extends ProfileState{
  final PassChange pass_Change;

  PassChangeState({required this.pass_Change});

  @override
  // TODO: implement props
  List<Object?> get props => [pass_Change];


}

class UpdateInfoState extends ProfileState{
  final update_info  updateEvent;

  UpdateInfoState({required this.updateEvent});

  @override
  // TODO: implement props
  List<Object?> get props => [updateEvent];


}




class ErrorProfileState extends ProfileState{
  final String message;

  ErrorProfileState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}
class MessageProfileState extends ProfileState{
  final String message;

  MessageProfileState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}