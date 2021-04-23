import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_chart_bar_widget.dart';
import './transaction_model.dart';

class TransactionChartWidget extends StatelessWidget {
  final List<TransactionModel> recentTransactions;

  TransactionChartWidget(
    this.recentTransactions,
  );

  List<Map<String, Object>> get _groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get _totalSpending {
    return _groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: TransactionChartBarWidget(
                data['day'] as String,
                data['amount'] as double,
                _totalSpending == 0.0
                    ? 0.0
                    : (data['amount']! as double) / _totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
