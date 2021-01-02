part of 'task_cubit.dart';

@immutable
class TaskState extends Equatable {
  const TaskState({
    this.tasks,
    this.loading = false,
    this.errorMessage,
  });

  final List<task.Task> tasks;
  final bool loading;
  final String errorMessage;

  factory TaskState.initial() => TaskState(tasks: []);

  TaskState inProgess() => _copyWith(loading: true);

  TaskState failure(String message) => _copyWith(errorMessage: message);

  TaskState update(List<task.Task> tasks) => _copyWith(tasks: tasks);

  _copyWith({
    List<task.Task> tasks,
    bool loading,
    String errorMessage,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      loading: loading ?? false,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object> get props => [...tasks, loading];
}
