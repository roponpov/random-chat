abstract class HomeEvent {}

class DisplayNameChanged extends HomeEvent {
  final String name;
  DisplayNameChanged(this.name);
}

class RandomizeNameRequested extends HomeEvent {}