import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String shopName;
  final String productSold;
  final int quantity;
  final double amount;
  final String? notes;
  final DateTime timestamp;
  final bool isSynced;

  Task({
    String? id,
    required this.shopName,
    required this.productSold,
    required this.quantity,
    required this.amount,
    this.notes,
    DateTime? timestamp,
    this.isSynced = false,
  })  : id = id ?? const Uuid().v4(),
        timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shopName': shopName,
      'productSold': productSold,
      'quantity': quantity,
      'amount': amount,
      'notes': notes,
      'timestamp': timestamp.toIso8601String(),
      'isSynced': isSynced ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      shopName: map['shopName'],
      productSold: map['productSold'],
      quantity: map['quantity'],
      amount: map['amount'],
      notes: map['notes'],
      timestamp: DateTime.parse(map['timestamp']),
      isSynced: map['isSynced'] == 1,
    );
  }
} 