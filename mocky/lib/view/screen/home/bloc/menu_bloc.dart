import 'package:equatable/equatable.dart';
import 'package:mocky/data/api/menu_response.dart';
import '../../../../data/service/Api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final APIService _apiService;

  MenuBloc(this._apiService) : super(MenuInitialState()) {
    on<MenuApiEvent>((event, emit) async {
      emit(MenuLoadingState());
      final response = await _apiService.getMenu();
        emit(MenuLoadedState(response!));

    });
  }
}
