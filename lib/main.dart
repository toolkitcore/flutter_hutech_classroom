import 'package:flutter/material.dart';
import 'package:flutter_hutech_classroom/managers/provider_manager.dart';
import 'package:flutter_hutech_classroom/managers/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ProviderManager.providers],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: RouteManager.login,
        routes: {...RouteManager.routes},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}