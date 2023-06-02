import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:localregister/provider/home_provider.dart';
import 'package:localregister/view/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("register");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Local Register",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
