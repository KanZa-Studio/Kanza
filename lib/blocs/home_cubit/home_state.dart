part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.tasks,
    this.errorMessage,
  });

  final List<task.Task> tasks;
  final String errorMessage;

  factory HomeState.initial() => HomeState(tasks: []);

  HomeState failure(String message) => _copyWith(errorMessage: message);

  HomeState update(List<task.Task> tasks) => _copyWith(tasks: tasks);

  _copyWith({
    List<task.Task> tasks,
    String errorMessage,
  }) {
    return HomeState(
      tasks: tasks ?? this.tasks,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object> get props => [...tasks, errorMessage];
}
