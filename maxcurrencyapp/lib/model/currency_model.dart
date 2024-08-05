import 'dart:convert';

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
    // To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);


Map<String, String> currencyModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String currencyModelToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));


}