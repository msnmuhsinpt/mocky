part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class MenuApiEvent extends MenuEvent {
  const MenuApiEvent();

  @override
  List<Object?> get props => [];
}
