import '../models/task.dart';

abstract class ITaskRepository {
  List<Task> get tasks;

  Future<void> addNewTask(Task task);

  Future<void> deleteTask(String taskId);

  Future<List<Task>> getArchievedTasks();
}
