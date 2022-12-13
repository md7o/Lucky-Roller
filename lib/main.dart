import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucky_roller/models/localy.dart';
import 'package:lucky_roller/screens/choices_roller.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalyAdapter());
  box = await Hive.openBox<Localy>('localy');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lucky Roller',
      theme: ThemeData(fontFamily: 'Cairo'),
      home: const ChoicesRoller(),
    );
  }
}
