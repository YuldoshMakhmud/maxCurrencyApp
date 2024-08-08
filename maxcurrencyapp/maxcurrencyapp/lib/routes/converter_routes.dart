import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/screens/home_page.dart';
import 'package:maxcurrencyapp/screens/widgets/splash_page.dart';

class ConverterRouteNmaes {
  static const String splash = "/splash";
  static const String home = "/home";
}

class ConverterRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConverterRouteNmaes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case ConverterRouteNmaes.home:
        return MaterialPageRoute(
            builder: (context) => HomePage(
                currencyData: settings.arguments as List<CurrencyModel>));
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
