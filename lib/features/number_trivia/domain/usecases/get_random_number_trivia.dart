import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_tdd/core/error/failures.dart';
import 'package:trivia_tdd/core/usecases/usecase.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {

  final NumberTriviaRepository repository;

  GetRandomNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {

    return await repository.getRandomNumberTrivia();
  }
  
}