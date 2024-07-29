import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/routes/converter_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ConverterRouteNmaes.splash,
      onGenerateRoute: ConverterRoutes.generateRoute,
    );
  }
}

