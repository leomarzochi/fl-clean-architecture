import 'package:flutter_clean/features/data/datasources/space_media_datasource.dart';
import 'package:flutter_clean/features/data/repositories/space_media_repository_implamentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SpaceMediaDatasourceSpy extends Mock implements SpaceMediaDatasource {}

void main() {
  SpaceMediaRepositoryImplementation repository;
  SpaceMediaDatasource datasource;

  setUp(() {
    datasource = SpaceMediaDatasourceSpy();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel();

  test('Should return SapceMediaModel when calling datasource', () {
    when(() => datasource.getSpaceMediaFromDate())
        .thenAnswer((_) async => tSpaceMediaModel);
  });
}
