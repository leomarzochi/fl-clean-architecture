import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_clean/core/errors/failure.dart';
import 'package:flutter_clean/core/usecase/usacase.dart';
import 'package:flutter_clean/features/domain/entities/space_media_entity.dart';
import 'package:flutter_clean/features/domain/repositories/space_media_repository.dart';
import 'package:flutter_clean/features/domain/usecases/get_space_media_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SpaceMediaRepositorySpy extends Mock implements SpaceMediaRepository {}

void main() {
  GetSpaceMediaUsecase sut;
  SpaceMediaRepository repository;

  setUp(() {
    repository = SpaceMediaRepositorySpy();
    sut = GetSpaceMediaUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
      description: 'description',
      mediaType: 'image',
      title: 'title',
      mediaUrl: faker.internet.httpUrl());

  final tDate = DateTime.now();
  test('Should get space media entity from the repository for a given date',
      () async {
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await sut(tDate);

    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('Should return ServerFailure when request dont succeed', () async {
    when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));

    final result = await sut(tDate);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}
