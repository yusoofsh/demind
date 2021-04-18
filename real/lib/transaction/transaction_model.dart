class TransactionModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  const TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
