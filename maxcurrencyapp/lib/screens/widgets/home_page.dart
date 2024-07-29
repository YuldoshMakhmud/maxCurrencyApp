import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.currencyData});
  final List<CurrencyModel> currencyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [],),
    );
  }
}