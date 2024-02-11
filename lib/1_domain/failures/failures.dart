import 'package:equatable/equatable.dart';

abstract class Failure {}


// * EquatableMixin
class ServerFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}
