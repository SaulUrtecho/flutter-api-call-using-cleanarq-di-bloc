import 'package:bloc_demo/core/failures.dart';
import 'package:either_dart/either.dart';

// These are general use cases

// This use case receive an input
abstract class InputUseCase<Out, Input> {
  Future<Either<Failure, Out>> run(Input input);
}

// This use case don't receive any parameter
abstract class NoInputUseCase<Out> {
  Future<Either<Failure, Out>> run();
}
