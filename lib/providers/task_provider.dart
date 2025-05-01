import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/database_helper.dart';

class TaskProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Task> _tasks = [];
  bool _isSyncing = false;
  bool _isFirebaseInitialized = false;
  bool _isInitialized = false;

  List<Task> get tasks => _tasks;
  bool get isSyncing => _isSyncing;
  bool get isFirebaseInitialized => _isFirebaseInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      _isFirebaseInitialized = false;
      
      await loadTasks();
      _isInitialized = true;
    } catch (e) {
      print('Error initializing: $e');
      _isFirebaseInitialized = false;
      try {
        await loadTasks();
        _isInitialized = true;
      } catch (loadError) {
        print('Error loading tasks: $loadError');
        _tasks = [];
        _isInitialized = true;
        notifyListeners();
      }
    }
  }

  Future<void> loadTasks() async {
    try {
      _tasks = await _dbHelper.getAllTasks();
      notifyListeners();
    } catch (e) {
      print('Error loading tasks: $e');
      notifyListeners();
      rethrow;
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _dbHelper.insertTask(task);
      await loadTasks();
    } catch (e) {
      print('Error adding task: $e');
      rethrow;
    }
  }

  Future<void> syncTasks() async {
    if (_isSyncing) return;

    _isSyncing = true;
    notifyListeners();

    try {
      await loadTasks();
    } catch (e) {
      print('Error syncing tasks: $e');
    } finally {
      _isSyncing = false;
      notifyListeners();
    }
  }
}
