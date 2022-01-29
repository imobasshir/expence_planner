import 'package:expence_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
              textScaleFactor: 3.0,
            ),
          ),
          Column(
              children: transactions.map(((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.indigoAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4.6),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '\$${tx.amount}',
                      style: const TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // color: Colors.grey,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().add_jm().format(tx.date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
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
