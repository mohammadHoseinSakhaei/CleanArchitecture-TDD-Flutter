import 'package:flutter_application_1/src/data/mapper/mapper_file/cat_dara_mapper.dart';
import 'package:flutter_application_1/src/data/mapper/toEntityMapper.dart';
import 'package:flutter_application_1/src/data/model/cat_model.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';

final CatMapper catMapper = CatMapper();
final CatDataMapper catDataMapper = CatDataMapper();
final CatLinksMapper catLinksMapper = CatLinksMapper();

class CatMapper implements ToEntityMapper<CatModel, CatEntity> {
  @override
  CatEntity mapToEntity(CatModel model) {
    final CatEntity catEntity = CatEntity();
    catEntity.data = catDataMapper.mapFromEntities(model.data!);
    catEntity.links = catLinksMapper.mapFromEntities(model.links!);
    catEntity.total = model.total;
    return catEntity;
  }

  List<CatEntity> mapFromEntities(List<CatModel> catModels) {
    return catModels.map((e) => mapToEntity(e)).toList();
  }
}
