import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ricky/data/models/charachter_model.dart';
import 'package:ricky/data/repositories/charachter_repo.dart';

part 'charachter_event.dart';
part 'charachter_state.dart';

class CharachterBloc extends Bloc<CharachterEvent, CharachterState> {
  CarachterRepository repository;
  CharachterBloc({required this.repository}) : super(CharachterInitial()) {
    on<CharachterLoadEvent>((event, emit) async {
      emit(CharachterLoading());
      try {
        emit(
          CharachterSucces(
            charachter: await repository.getCharachters(),
          ),
        );
      } catch (e) {
        CharachterError(errorText: e.toString());
      }
    });
  }
}
