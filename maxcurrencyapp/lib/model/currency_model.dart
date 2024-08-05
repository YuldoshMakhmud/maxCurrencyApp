import 'package:flutter/src/material/dropdown.dart';

class CurrencyModel {
    String? title;
    String? code;
    String? cbPrice;
    String? nbuBuyPrice;
    String? nbuCellPrice;
    String? date;
    String? flagUrl;

    CurrencyModel({
        required this.title,
        required this.code,
        required this.cbPrice,
        required this.nbuBuyPrice,
        required this.nbuCellPrice,
        required this.date,
 
        
    });

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: json["date"],
    
    );

  static map(DropdownMenuItem<String> Function(String value) param0) {}
}