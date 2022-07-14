part of 'switch_bloc.dart';

@immutable
abstract class SwitchEvent {
  const  SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchEvent{}
class SwitchOffEvent extends SwitchEvent{}

