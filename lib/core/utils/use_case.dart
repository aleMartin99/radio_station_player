// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:fpdart/fpdart.dart';
import 'package:radio_station_player/core/errors/failures.dart';

/// Generic class for Use cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
