import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<NameChanged>(_onNameChanged);
    on<GenerateRandomName>(_onGenerateRandomName);
    on<SubmitDisplayName>(_onSubmitDisplayName);
  }

  void _onNameChanged(NameChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(displayName: event.name));
  }

  void _onGenerateRandomName(GenerateRandomName event, Emitter<HomeState> emit) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();

    final String randomName = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();

    emit(state.copyWith(displayName: randomName));
  }

  void _onSubmitDisplayName(SubmitDisplayName event, Emitter<HomeState> emit) {
    emit(state.copyWith(navigateToChat: false));
    if (state.displayName.trim().isEmpty) {
      emit(state.copyWith(errorMessage: "Display name can't be null or empty."));
    } else {
      emit(state.copyWith(navigateToChat: true));
    }
  }
}