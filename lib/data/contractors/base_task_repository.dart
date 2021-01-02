import '../models/task.dart';

abstract class ITaskRepository {
  Future<List<Task>> getAllTasks();

  Future<void> addNewTask(Task task);

  Future<void> deleteTask(String taskId);

  Future<List<Task>> getArchievedTasks();
}
