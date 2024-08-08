import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final double? convertedAmount;
  final String targetCurrencyCode;

  ConversionResult({
    required this.convertedAmount,
    required this.targetCurrencyCode,
  });

  @override
  Widget build(BuildContext context) {
    return convertedAmount != null
        ? Text(
            'Converted Amount: $convertedAmount $targetCurrencyCode',
            style: TextStyle(fontSize: 20),
          )
        : Container();
  }
}
