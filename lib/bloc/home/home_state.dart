part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

@immutable
class InitialState extends HomeState {
  const InitialState();

  @override
  List<Object> get props => [];
}
