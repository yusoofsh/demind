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
        primarySwatch: Colors.green,
        accentColor: Colors.purpleAccent,
        fontFamily: 'Quicksand',
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
  bool _showChart = false;

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
        actions: _isLandscape
            ? [
                IconButton(
                  icon: _showChart
                      ? Icon(
                          Icons.list_outlined,
                          color: Theme.of(context).iconTheme.color,
                        )
                      : Icon(
                          Icons.bar_chart_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                  onPressed: () => setState(() {
                    if (_showChart) {
                      _showChart = false;
                    } else {
                      _showChart = true;
                    }
                  }),
                )
              ]
            : null,
      );

  double get _calculateScreenHeight =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      appBar.preferredSize.height;

  bool get _isLandscape =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  Container _transactionChartContainer({double heightMultiplier = 1}) =>
      Container(
        height: _calculateScreenHeight * heightMultiplier,
        child: TransactionChartWidget(
          _recentTransactions,
        ),
      );

  Container _transactionListContainer({double heightMultiplier = 1}) =>
      Container(
        height: _calculateScreenHeight * heightMultiplier,
        child: TransactionListWidget(
          transactions: _transactions,
          deleteTransaction: _deleteTransaction,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () => _startAddNewTransaction(),
      ),
      body: _isLandscape
          ? Center(
              child: _showChart
                  ? _transactionChartContainer()
                  : _transactionListContainer(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _transactionChartContainer(heightMultiplier: 0.3),
                    _transactionListContainer(heightMultiplier: 0.7),
                  ],
                ),
              ),
            ),
    );
  }
}
