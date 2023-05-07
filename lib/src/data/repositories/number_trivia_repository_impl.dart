import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/httpClient.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/src/data/data_source/local/number_trivia_local_data_source.dart';
import 'package:flutter_application_1/src/data/data_source/remote/number_trivia_remote_data_source.dart';
import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/src/data/mapper/mapper_file/cat_mapper.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:flutter_application_1/src/domain/repository/number_trivia_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

final catRepositoryImpl = CatRepositoryImpl(
  CatRemoteDataSource(httpClient),
  CatLocalDataSourceImpl(box: Hive.box(catBoxName)),
  catMapper,
);

class CatRepositoryImpl implements ICatRepository {
  final ICatRemoteDataSource catRemoteDataSource;
  final ICatLocalDataSource catLocalDataSource;
  final CatMapper catMapper;

  CatRepositoryImpl(this.catRemoteDataSource, this.catLocalDataSource, this.catMapper);

  @override
  Future<DataState<List<CatEntity>>> getCatsLists() async {
    if (catLocalDataSource.catListSize() > 0) {
      final cats = catLocalDataSource.getCatsList();
      return DataSuccess(cats);
    } else {
      try {
        final response = await catRemoteDataSource.getCatModel();
        if (response.data != null) {
          catLocalDataSource.insertCatsToDb(response.data!);
        }
        return DataSuccess(catMapper.mapFromEntities([response.data!]));
      } catch (e) {
        return const DataFailed('error has occured');
      }
    }
  }
}
