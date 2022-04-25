// @dart=2.9

import 'package:farm_gate/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:farm_gate/pages/root_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

//Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
