import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';

abstract class ICatRepository {
  Future<DataState<List<CatEntity>>> getCatsLists();
}
