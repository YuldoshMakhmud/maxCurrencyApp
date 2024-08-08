import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';

class CurrencyDropdown extends StatelessWidget {
  final List<CurrencyModel> currencies;
  final CurrencyModel? selectedCurrency;
  final ValueChanged<CurrencyModel?> onChanged;
  final String labelText;

  CurrencyDropdown({
    required this.currencies,
    required this.selectedCurrency,
    required this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CurrencyModel>(
      value: selectedCurrency,
      onChanged: onChanged,
      items: currencies
          .map<DropdownMenuItem<CurrencyModel>>((CurrencyModel currency) {
        return DropdownMenuItem<CurrencyModel>(
          value: currency,
          child: Text(currency.title!),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
