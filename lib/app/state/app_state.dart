import 'package:identity_in_perception/identity_in_perception.dart';
import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:abstractions/error_correction.dart';
import 'package:abstractions/framing.dart';

class AppState
    implements
        CoreBeliefs,
        FramingConcept,
        ErrorCorrectionConcept,
        IdentityConcept {
  AppState({required this.error, required this.auth, required this.framing});

  static AppState get initial => AppState(
      error: DefaultErrorCorrectionBeliefs.initial,
      auth: AuthBeliefSystem.initialBeliefs(),
      framing: DefaultFramingBeliefs.initial);

  @override
  final IdentityBeliefs auth;

  @override
  final DefaultErrorCorrectionBeliefs error;

  @override
  final DefaultFramingBeliefs framing;

  @override
  AppState copyWith({
    DefaultErrorCorrectionBeliefs? error,
    IdentityBeliefs? auth,
    DefaultFramingBeliefs? framing,
  }) {
    return AppState(
      error: error ?? this.error,
      auth: auth ?? this.auth,
      framing: framing ?? this.framing,
    );
  }

  @override
  toJson() => {
        'auth': auth.toJson(),
        'error': error.toJson(),
        'navigation': framing.toJson(),
      };
}
