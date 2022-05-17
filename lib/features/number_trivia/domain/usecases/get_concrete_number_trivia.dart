import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_tdd/core/usecases/usecase.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/error/failures.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int> {

  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

}

class Params extends Equatable {

  final int number;

  const Params({required this.number}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}