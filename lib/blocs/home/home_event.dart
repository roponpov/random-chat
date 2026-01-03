abstract class HomeEvent {}

class NameChanged extends HomeEvent {
  final String name;
  NameChanged(this.name);
}

class GenerateRandomName extends HomeEvent {}

class SubmitDisplayName extends HomeEvent {}