class HomeState {
  final String displayName;
  final String? error;

  HomeState({this.displayName = '', this.error});

  HomeState copyWith({String? displayName, String? error}) {
    return HomeState(
      displayName: displayName ?? this.displayName,
      error: error,
    );
  }
}