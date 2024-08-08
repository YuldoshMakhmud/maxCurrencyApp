import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/screens/widgets/conversion_result.dart';
import 'package:maxcurrencyapp/screens/widgets/currency_dropdown.dart';
import 'package:maxcurrencyapp/screens/widgets/currency_exchange.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _uzsAmountController = TextEditingController();
  double? _convertedAmount;
  double? _convertedFromUzsAmount;

  final List<CurrencyModel> currencies = [
    CurrencyModel(
      title: "US Dollar",
      code: "USD",
      cbPrice: "11430.00",
      nbuBuyPrice: "11420.00",
      nbuCellPrice: "11450.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Euro",
      code: "EUR",
      cbPrice: "12700.00",
      nbuBuyPrice: "12680.00",
      nbuCellPrice: "12720.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Russian Ruble",
      code: "RUB",
      cbPrice: "150.00",
      nbuBuyPrice: "149.50",
      nbuCellPrice: "150.50",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "British Pound",
      code: "GBP",
      cbPrice: "15000.00",
      nbuBuyPrice: "14950.00",
      nbuCellPrice: "15050.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Canadian Dollar",
      code: "CAD",
      cbPrice: "8500.00",
      nbuBuyPrice: "8450.00",
      nbuCellPrice: "8550.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Saudi Riyal",
      code: "SAR",
      cbPrice: "3050.00",
      nbuBuyPrice: "3040.00",
      nbuCellPrice: "3060.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Kazakhstani Tenge",
      code: "KZT",
      cbPrice: "25.00",
      nbuBuyPrice: "24.80",
      nbuCellPrice: "25.20",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "Chinese Yuan",
      code: "CNY",
      cbPrice: "1560.00",
      nbuBuyPrice: "1550.00",
      nbuCellPrice: "1570.00",
      date: "2024-08-09",
    ),
    CurrencyModel(
      title: "South Korean Won",
      code: "KRW",
      cbPrice: "9.00",
      nbuBuyPrice: "8.90",
      nbuCellPrice: "9.10",
      date: "2024-08-09",
    ),
  ];

  CurrencyModel? _selectedCurrency;
  CurrencyModel? _targetCurrency;

  @override
  void initState() {
    super.initState();
    if (currencies.isNotEmpty) {
      _selectedCurrency = currencies[0];
      _targetCurrency = currencies[0];
    }
  }

  void _convertCurrencyToUZS() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0 && _selectedCurrency != null) {
      CurrencyExchange exchange = CurrencyExchange();
      setState(() {
        _convertedAmount = exchange.convertToUzbekSom(
          fromCurrency: _selectedCurrency!,
          amount: amount,
        );
      });
    }
  }

  void _convertCurrencyFromUZS() {
    double uzsAmount = double.tryParse(_uzsAmountController.text) ?? 0;
    if (uzsAmount > 0 && _targetCurrency != null) {
      CurrencyExchange exchange = CurrencyExchange();
      setState(() {
        _convertedFromUzsAmount = exchange.convertFromUzbekSom(
          toCurrency: _targetCurrency!,
          amount: uzsAmount,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 105, 143),
        title: const Text(
          'Valyuta Ayrboshlash',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrencyDropdown(
                currencies: currencies,
                selectedCurrency: _selectedCurrency,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCurrency = newValue;
                  });
                },
                labelText: 'Select Currency to Convert to UZS',
              ),
              SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _convertCurrencyToUZS,
                child: Text('Convert to UZS'),
              ),
              SizedBox(height: 16),
              ConversionResult(
                convertedAmount: _convertedAmount,
                targetCurrencyCode: 'UZS',
              ),
              SizedBox(height: 32),
              CurrencyDropdown(
                currencies: currencies,
                selectedCurrency: _targetCurrency,
                onChanged: (newValue) {
                  setState(() {
                    _targetCurrency = newValue;
                  });
                },
                labelText: 'Select Currency to Convert UZS to',
              ),
              SizedBox(height: 16),
              TextField(
                controller: _uzsAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter amount in UZS',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _convertCurrencyFromUZS,
                child: Text('Convert from UZS'),
              ),
              SizedBox(height: 16),
              ConversionResult(
                convertedAmount: _convertedFromUzsAmount,
                targetCurrencyCode: _targetCurrency?.code ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
