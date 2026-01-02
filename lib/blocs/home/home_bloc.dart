import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'dart:math';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<String> _randomNames = ['Mystery Guest', 'Cyber Traveler', 'Pixel Nomad'];

  HomeBloc() : super(HomeState()) {
    on<DisplayNameChanged>((event, emit) {
      emit(state.copyWith(displayName: event.name, error: null));
    });

    on<RandomizeNameRequested>((event, emit) {
      final randomName = _randomNames[Random().nextInt(_randomNames.length)];
      emit(state.copyWith(displayName: randomName, error: null));
    });
  }
}