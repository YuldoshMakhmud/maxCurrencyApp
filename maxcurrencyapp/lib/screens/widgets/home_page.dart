import 'package:flutter/material.dart';
import 'package:maxcurrencyapp/model/currency_model.dart';
import 'package:maxcurrencyapp/screens/widgets/exchanger_page.dart';
import 'package:maxcurrencyapp/screens/widgets/item_card.dart';
import 'package:maxcurrencyapp/screens/widgets/selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.currencyData,});
  final List<CurrencyModel> currencyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
      child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
                children: [
               SizedBox(
                height: MediaQuery.of(context).size.height*0.30,
                child:  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                    ),
                    margin:const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                    const  DropDownPage(),
                                       ElevatedButton(
                                        style: ButtonStyle(
                                       backgroundColor:    MaterialStateProperty.all<Color>( Colors.black),
                                        ),
                                
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExchengerPage()));
                                },
                                child: const Icon(Icons.currency_exchange,size: 40,color: Colors.white,)),


                            ],),
                           Text(" 100,000", style: TextStyle(color: Colors.white,fontSize: 70),)
                          ],
                        ),
                  ),
            
               )
              ],
              )
              ),

            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                color: Colors.white,
                ),
            child: ListView.builder(
              itemCount: currencyData.length,
              itemBuilder: (context,index){
                return ItemCard(countryCode: currencyData[index].code.toString(),
                 price: currencyData[index].cbPrice.toString(),
                  title: currencyData[index].title.toString(), flagUrl: '${currencyData[index]}', currencyData: [],);
              }),
              ),
              
              ),
        ],
        ),
      ),
    );
  }
}