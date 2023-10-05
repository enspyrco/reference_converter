import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:abstractions/error_correction.dart';
import 'package:abstractions/framing.dart';
import 'package:percepts/percepts.dart';

class AppState
    implements
        CoreBeliefs,
        FramingConcept,
        ErrorCorrectionConcept,
        IdentityConcept {
  AppState(
      {required this.error, required this.identity, required this.framing});

  static AppState get initial => AppState(
      error: DefaultErrorCorrectionBeliefs.initial,
      identity: DefaultIdentityBeliefs.initial,
      framing: DefaultFramingBeliefs.initial);

  @override
  final IdentityBeliefs identity;

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
      identity: auth ?? this.identity,
      framing: framing ?? this.framing,
    );
  }

  @override
  toJson() => {
        'identity': identity.toJson(),
        'error': error.toJson(),
        'navigation': framing.toJson(),
      };
}
