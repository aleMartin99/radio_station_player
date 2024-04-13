// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

/// Key to access the unexpected failure text value
const String _kUnexpectedFailure = 'Unexpected failure';

/// Key to access the unexpected failure text value
const String _kUnknownFailure = 'Unexpected failure';

/// Key to access the server failure text value
const String _kServerFailure = 'Server failure';

/// Failure class
abstract class Failure with EquatableMixin {
  const Failure({
    this.message = _kUnknownFailure,
    this.properties,
  });
  final String? message;
  final List<dynamic>? properties;

  @override
  List<Object?> get props => [properties];
}

/// ServerFailure class
class ServerFailure extends Failure {
  const ServerFailure({super.message = _kServerFailure});
}

/// UnexpectedFailure class
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = _kUnexpectedFailure});
}
