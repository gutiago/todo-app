part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  Stream<HomeState> applyAsync(HomeBloc bloc);

  @override
  List<Object> get props => [];
}

@immutable
class LoadContentEvent extends HomeEvent {
  LoadContentEvent();

  @override
  Stream<HomeState> applyAsync(HomeBloc bloc) async* {
    yield InitialState();
  }
}
