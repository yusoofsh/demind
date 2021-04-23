import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_model.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final Function(String) deleteTransaction;

  const TransactionListWidget({
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Text(
              'No transactions added yet!',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('\$${transactions[index].amount}'),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_outlined),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteTransaction(transactions[index].id),
            ),
          ),
        ),
      );
    }
  }
}
