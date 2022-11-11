import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/features/home/models/home_model.dart';
import 'package:pokemon/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final HomeRepository _apiRepository = HomeRepository();

    on<GetHomeList>((event, emit) async {
      try {
        emit(HomeLoading());
        final List = await _apiRepository.getList();
        emit(HomeLoaded(List));
        if (List.error != null) {
          emit(HomeError(List.error));
        }
      } on NetworkError {
        emit(HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
