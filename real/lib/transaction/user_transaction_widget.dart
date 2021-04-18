import 'package:flutter/material.dart';

import './new_transaction_widget.dart';
import './transaction_list_widget.dart';
import './transaction_model.dart';

class UserTransactionWidget extends StatefulWidget {
  UserTransactionWidget({Key? key}) : super(key: key);

  @override
  _UserTransactionWidgetState createState() => _UserTransactionWidgetState();
}

class _UserTransactionWidgetState extends State<UserTransactionWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionWidget(
          _addNewTransaction,
        ),
        TransactionListWidget(
          transactions: _transactions,
        ),
      ],
    );
  }
}
