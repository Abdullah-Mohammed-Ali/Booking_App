part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();
}

class hotelsInitial extends HotelsState {

  @override
  List<Object> get props => [];
}


class LoadingHotelsState extends HotelsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}






class GetHotelsState extends HotelsState{
  final Hotels hotels;

  GetHotelsState({required this.hotels});

  @override
  // TODO: implement props
  List<Object?> get props => [hotels];


}





class ErrorHotelsState extends HotelsState{
  final String message;

  ErrorHotelsState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}
class MessageBookingState extends HotelsState{
  final String message;

  MessageBookingState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}