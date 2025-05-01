import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/task.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<void> syncTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).set({
        'shopName': task.shopName,
        'productSold': task.productSold,
        'quantity': task.quantity,
        'amount': task.amount,
        'notes': task.notes,
        'timestamp': task.timestamp,
      });
    } catch (e) {
      print('Error syncing task: $e');
      rethrow;
    }
  }

  Future<void> syncAllTasks(List<Task> tasks) async {
    final batch = _firestore.batch();

    for (var task in tasks) {
      final docRef = _firestore.collection('tasks').doc(task.id);
      batch.set(docRef, {
        'shopName': task.shopName,
        'productSold': task.productSold,
        'quantity': task.quantity,
        'amount': task.amount,
        'notes': task.notes,
        'timestamp': task.timestamp,
      });
    }

    try {
      await batch.commit();
    } catch (e) {
      print('Error syncing batch: $e');
      rethrow;
    }
  }
}
