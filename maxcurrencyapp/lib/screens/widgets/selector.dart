import 'package:flutter/material.dart';

class DropDownPage extends StatelessWidget {
  const DropDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("Total Balance",style: TextStyle(color: Colors.white,fontSize: 25),),
        Icon(Icons.arrow_drop_down, color: Colors.white,)
      ],
    );
  }
}