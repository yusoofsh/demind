import 'package:flutter/material.dart';

import './transaction/transaction_list_widget.dart';
import './transaction/transaction_model.dart';
import 'transaction/new_transaction_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TransactionModel> _transactions = [
    TransactionModel(
      id: 't1',
      title: 'Nice Shoes',
      amount: 69.42,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: 't2',
      title: 'Banana Good Grade',
      amount: 11.31,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(
    String title,
    double amount,
  ) {
    final _newTransaction = TransactionModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() => _transactions.add(_newTransaction));
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewTransactionWidget(
        _addNewTransaction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () => _startAddNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionListWidget(transactions: _transactions),
          ],
        ),
      ),
    );
  }
}
