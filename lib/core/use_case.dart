import 'package:flutter_application_1/core/data_state.dart';

abstract class BaseUseCase<Type,Params> {
  Future<DataState<Type>> invoke(Params params);
}
