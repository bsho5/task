import 'package:flutter/material.dart';
import 'package:task/config.dart';
import 'package:task/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: const Home()
      ),
       debugShowCheckedModeBanner: false,
    );
  }
}
