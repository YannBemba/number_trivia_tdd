import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_tdd/core/usecases/usecase.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivia_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:trivia_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {

  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(repository: mockNumberTriviaRepository!);
  });

  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'Should get trivia from the repository',
        () async {
      when(mockNumberTriviaRepository!.getRandomNumberTrivia())
          .thenAnswer((realInvocation) async => const Right(tNumberTrivia));

      //act

      final result = await usecase!(NoParams());

      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);

    },
  );

}