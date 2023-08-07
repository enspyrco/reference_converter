import 'package:auth_for_perception/auth_for_perception.dart';
import 'package:error_handling_for_perception/error_handling_for_perception.dart';
import 'package:navigation_for_perception/navigation_for_perception.dart';
import 'package:types_for_perception/auth_beliefs.dart';
import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/error_handling_types.dart';
import 'package:types_for_perception/navigation_types.dart';

class AppState
    implements
        CoreBeliefs,
        AppStateNavigation,
        AppStateErrorHandling,
        AuthConcept {
  AppState({required this.error, required this.auth, required this.navigation});

  static AppState get initial => AppState(
      error: DefaultErrorHandlingState.initial,
      auth: AuthBeliefSystem.initialBeliefs(),
      navigation: DefaultNavigationState.initial);

  @override
  final AuthBeliefs auth;

  @override
  final DefaultErrorHandlingState error;

  @override
  final DefaultNavigationState navigation;

  @override
  AppState copyWith({
    DefaultErrorHandlingState? error,
    AuthBeliefs? auth,
    DefaultNavigationState? navigation,
  }) {
    return AppState(
      error: error ?? this.error,
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
    );
  }

  @override
  toJson() => {
        'auth': auth.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
      };
}
