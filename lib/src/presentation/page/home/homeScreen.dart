import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/data_state.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:flutter_application_1/src/domain/usecase/number_trivia_usecase.dart';
import 'package:flutter_application_1/src/presentation/page/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('clean architecture'),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = HomeBloc(catUseCase);
          bloc.add(HomePageStarted());
          return bloc;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccess) {
              return SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    addDataToList(state.catEntity);
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index]),
                          )),
                    );
                  },
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.error));
            } else {
              throw Exception('state is not valid');
            }
          },
        ),
      ),
    );
  }

  void addDataToList(DataState<List<CatEntity>> catEntity) {
    for (int i = 0; i < catEntity.data!.length; i++) {
      for (int j = 0; j < catEntity.data![i].data!.length; j++) {
        data.add(catEntity.data![i].data![j].breed.toString());
      }
    }
  }
}
