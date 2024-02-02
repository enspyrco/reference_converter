import 'package:perception/perception.dart';

class AppBeliefs
    implements
        CoreBeliefs,
        FramingConcept,
        ErrorCorrectionConcept,
        IdentityConcept {
  AppBeliefs(
      {required this.error, required this.identity, required this.framing});

  static AppBeliefs get initial => AppBeliefs(
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
  AppBeliefs copyWith({
    DefaultErrorCorrectionBeliefs? error,
    IdentityBeliefs? identity,
    DefaultFramingBeliefs? framing,
  }) {
    return AppBeliefs(
      error: error ?? this.error,
      identity: identity ?? this.identity,
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
