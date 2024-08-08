import 'package:maxcurrencyapp/model/currency_model.dart';

class CurrencyExchange {
  double convertToUzbekSom({
    required CurrencyModel fromCurrency,
    required double amount,
    bool useCbPrice = true,
  }) {
    double fromRate = useCbPrice
        ? double.tryParse(fromCurrency.cbPrice ?? '0') ?? 0
        : double.tryParse(fromCurrency.nbuBuyPrice ?? '0') ?? 0;

    if (fromRate == 0) {
      throw Exception("Invalid currency rate");
    }

    return amount * fromRate;
  }

  double convertFromUzbekSom({
    required CurrencyModel toCurrency,
    required double amount,
    bool useCbPrice = true,
  }) {
    double toRate = useCbPrice
        ? double.tryParse(toCurrency.cbPrice ?? '0') ?? 0
        : double.tryParse(toCurrency.nbuCellPrice ?? '0') ?? 0;

    if (toRate == 0) {
      throw Exception("Invalid currency rate");
    }

    return amount / toRate;
  }
}
