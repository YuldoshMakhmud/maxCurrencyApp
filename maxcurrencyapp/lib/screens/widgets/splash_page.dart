import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maxcurrencyapp/core/resource/resource.dart';
import 'package:maxcurrencyapp/service/api_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FutureBuilder(
      future: ApiService.getCurrency(context),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
      return Lottie.asset(LottieAssets.splash);
     },),
    );
  }
}