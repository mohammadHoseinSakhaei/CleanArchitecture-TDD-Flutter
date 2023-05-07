import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/src/data/model/cat_model.dart';

abstract class ICatRemoteDataSource {
  Future<DataState<CatModel>> getCatModel();
}

class CatRemoteDataSource implements ICatRemoteDataSource {
  final Dio httpClient;

  CatRemoteDataSource(this.httpClient);

  @override
  Future<DataState<CatModel>> getCatModel() async {
    final response = await httpClient.get('https://catfact.ninja/breeds');
    if (response.statusCode == 200) {
      final catModel = CatModel.fromJson(response.data);
      return DataSuccess(catModel);
    } else {
      return const DataFailed('error has server');
    }
  }
}
