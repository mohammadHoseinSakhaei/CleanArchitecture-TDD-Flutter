import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/src/data/mapper/mapper_file/cat_mapper.dart';
import 'package:flutter_application_1/src/data/model/cat_model.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICatLocalDataSource {
  List<CatEntity> getCatsList();
  void insertCatsToDb(CatModel catModel);
  int catListSize();
}

class CatLocalDataSourceImpl implements ICatLocalDataSource {
  final Box<CatEntity> box;

  CatLocalDataSourceImpl({required this.box});

  @override
  List<CatEntity> getCatsList() {
    return box.values.toList();
  }

  @override
  void insertCatsToDb(CatModel catModel) {
    box.add(catMapper.mapToEntity(catModel));
  }

  @override
  int catListSize() {
    return box.values.toList().length;
  }
}
