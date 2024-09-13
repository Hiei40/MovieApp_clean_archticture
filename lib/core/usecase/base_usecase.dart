import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/faliure.dart';

abstract class BaseUsecase<T,Parameters> {
  Future<Either<Faliure, T>> call(Parameters parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}