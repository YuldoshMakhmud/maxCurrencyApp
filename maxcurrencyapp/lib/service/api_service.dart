import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/routes/converter_routes.dart';

class ApiService{
  static Future getCurrency(context) async{
    try{
      Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      List<CurrencyModel> list =(res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
      Navigator.pushNamedAndRemoveUntil(context, ConverterRouteNmaes.home, (Route<dynamic> route) => false, arguments: list);
      
    }catch(e){
      print("Error: $e");
    }
  }
}