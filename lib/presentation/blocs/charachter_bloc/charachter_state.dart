part of 'charachter_bloc.dart';

@immutable
sealed class CharachterState {}

final class CharachterInitial extends CharachterState {}

final class CharachterLoading extends CharachterState {}

final class CharachterSucces extends CharachterState {
  final CharachterModel charachter;

  CharachterSucces({required this.charachter});
}

final class CharachterError extends CharachterState {
  final String errorText;

  CharachterError({required this.errorText});
}
