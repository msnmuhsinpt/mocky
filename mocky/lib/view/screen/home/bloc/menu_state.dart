part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();
}

class MenuInitialState extends MenuState {
  @override
  List<Object> get props => [];
}

class MenuLoadingState extends MenuState {
  @override
  List<Object> get props => [];
}

class MenuLoadedState extends MenuState {
  final MenuResponse response;

  const MenuLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class ErrorState extends MenuState {
  const ErrorState();

  @override
  List<Object> get props => [];
}

class UnAuthorizedState extends MenuState {
  final String message;

  const UnAuthorizedState(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class NoInternetState extends MenuState {
  const NoInternetState();

  @override
  List<Object?> get props => [];
}
