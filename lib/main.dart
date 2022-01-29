import 'package:expence_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.laila().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 400,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'New Socks',
        amount: 100,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't3',
        title: 'Weekly Groceries',
        amount: 700,
        date: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          const Card(
            child: Text(
              'CHART',
              textScaleFactor: 3.0,
            ),
          ),
          Column(
              children: transactions.map(((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      tx.amount.toString(),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tx.title,
                      ),
                      Text(
                        tx.date.toString(),
                      )
                    ],
                  ),
                ],
              ),
            );
          })).toList()),
        ],
      ),
    );
  }
}
