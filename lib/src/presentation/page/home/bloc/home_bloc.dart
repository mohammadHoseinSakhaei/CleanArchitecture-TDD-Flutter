import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:flutter_application_1/src/domain/usecase/number_trivia_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CatUseCase catUseCase;
  HomeBloc(this.catUseCase) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomePageStarted) {
        try {
          final catData = await catUseCase.invoke(Params());
          emit(HomeSuccess(catData));
        } catch (e) {
          emit(HomeError(e.toString()));
        }
      }
    });
  }
}
