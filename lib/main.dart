import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/domain/entites/cat_entity.dart';
import 'package:flutter_application_1/src/presentation/page/home/homeScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

const catBoxName = 'catBox';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatEntityAdapter());
  Hive.registerAdapter(DataEntityAdapter());
  Hive.registerAdapter(LinksEntityAdapter());
  await Hive.openBox<CatEntity>(catBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}
