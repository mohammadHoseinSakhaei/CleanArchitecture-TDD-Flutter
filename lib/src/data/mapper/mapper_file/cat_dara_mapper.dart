import 'package:flutter_application_1/src/data/mapper/toEntityMapper.dart';
import 'package:flutter_application_1/src/data/model/cat_model.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';

class CatDataMapper implements ToEntityMapper<Data, DataEntity> {
  @override
  DataEntity mapToEntity(Data model) {
    final DataEntity dataEntity = DataEntity();
    dataEntity.breed = model.breed;
    dataEntity.coat = model.coat;
    dataEntity.pattern = model.pattern;
    dataEntity.country = model.country;
    dataEntity.origin = model.origin;
    return dataEntity;
  }

  List<DataEntity> mapFromEntities(List<Data> catModels) {
    return catModels.map((e) => mapToEntity(e)).toList();
  }
}

class CatLinksMapper implements ToEntityMapper<Links, LinksEntity> {
  @override
  LinksEntity mapToEntity(Links model) {
    final LinksEntity linksEntity = LinksEntity();
    linksEntity.active = model.active;
    linksEntity.url = model.url;
    linksEntity.label = model.label;
    return linksEntity;
  }

  List<LinksEntity> mapFromEntities(List<Links> catModels) {
    return catModels.map((e) => mapToEntity(e)).toList();
  }
}
