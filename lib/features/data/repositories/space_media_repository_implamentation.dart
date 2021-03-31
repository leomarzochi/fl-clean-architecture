import 'package:dartz/dartz.dart';
import '../datasources/space_media_datasource.dart';

import '../../../core/errors/failure.dart';
import '../../domain/entities/space_media_entity.dart';
import '../../domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation extends SpaceMediaRepository {
  final SpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) {
    // TODO: implement getSpaceMediaFromDate
    throw UnimplementedError();
  }
}
