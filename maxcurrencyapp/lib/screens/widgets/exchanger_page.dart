import 'package:flutter/material.dart';

class ExchengerPage extends StatefulWidget {
  const ExchengerPage({super.key});

  @override
  State<ExchengerPage> createState() => _ExchengerPageState();
}

class _ExchengerPageState extends State<ExchengerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange Info"),
        
      ),
         body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
             
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter amount in USD'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:(){},
              child: Text('Convert to EUR'),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Amount: EUR',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
   
  }