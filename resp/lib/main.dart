import 'package:flutter/material.dart';

import './transaction/new_transaction_widget.dart';
import './transaction/transaction_chart_widget.dart';
import './transaction/transaction_list_widget.dart';
import './transaction/transaction_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.purpleAccent,
        fontFamily: 'Quicksand',
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
    String title,
    double amount,
    DateTime chosenDate,
  ) {
    final _newTransaction = TransactionModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() => _transactions.add(_newTransaction));
  }

  void _startAddNewTransaction() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: NewTransactionWidget(
            _addNewTransaction,
          ),
          onTap: () {},
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(
      () => _transactions.removeWhere(
        (transaction) => transaction.id == id,
      ),
    );
  }

  AppBar get appBar => AppBar(
        title: Text('Personal Expenses'),
      );

  double get _calculateScreenHeight =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      appBar.preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () => _startAddNewTransaction(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: _calculateScreenHeight * 0.4,
              child: TransactionChartWidget(_recentTransactions),
            ),
            SizedBox(
              height: _calculateScreenHeight * 0.6,
              child: TransactionListWidget(
                transactions: _transactions,
                deleteTransaction: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}