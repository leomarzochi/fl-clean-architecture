import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usacase.dart';
import '../entities/space_media_entity.dart';
import '../repositories/space_media_repository.dart';

class GetSpaceMediaUsecase extends Usecase<SpaceMediaEntity, DateTime> {
  final SpaceMediaRepository repository;

  GetSpaceMediaUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
