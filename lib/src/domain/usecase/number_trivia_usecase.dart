import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/core/use_case.dart';
import 'package:flutter_application_1/src/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:flutter_application_1/src/domain/repository/number_trivia_repository.dart';

final catUseCase = CatUseCase(catRepositoryImpl);

class CatUseCase implements BaseUseCase<List<CatEntity>, Params> {
  final ICatRepository _catRepository;

  CatUseCase(this._catRepository);

  @override
  Future<DataState<List<CatEntity>>> invoke(Params params) async {
    return await _catRepository.getCatsLists();
  }
}

class Params {}
