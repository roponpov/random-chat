import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String displayName;
  final String? errorMessage;
  final bool navigateToChat;

  const HomeState({
    this.displayName = '',
    this.errorMessage,
    this.navigateToChat = false,
  });

  HomeState copyWith({
    String? displayName,
    String? errorMessage,
    bool? navigateToChat,
  }) {
    return HomeState(
      displayName: displayName ?? this.displayName,
      errorMessage: errorMessage,
      navigateToChat: navigateToChat ?? false,
    );
  }

  @override
  List<Object?> get props => [displayName, errorMessage, navigateToChat];
}