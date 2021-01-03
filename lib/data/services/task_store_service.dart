/*
 * Created on Sat Jan 02 2021
 *
 * BSD 3-Clause License
 *
 *Copyright (c) 2020, Kanan Yusubov
 *All rights reserved.
 *
 *Redistribution and use in source and binary forms, with or without
 *modification, are permitted provided that the following conditions are met:
 *
 *1. Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *2. Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *3. Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 *THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:hive/hive.dart';

import '../models/task.dart';

class TaskStoreService {
  TaskStoreService._();

  static TaskStoreService _instance;
  static TaskStoreService get instance => _instance;

  Box<List<Task>> _tasksBox;

  List<Task> _tasks;
  List<Task> _archievedTasks = [];

  static Future<void> init() async {
    if (_instance == null) {
      final box = await Hive.openBox<List<Task>>('tasksBox');
      _instance = TaskStoreService._();
      _instance._tasksBox = box;
      _instance._getAllTasks();
    }
  }

  void _getAllTasks() => _tasks = _tasksBox.get('tasks') ?? [];

  List<Task> get tasks => [..._tasks];

  List<Task> get archivedTasks => [..._archievedTasks];

  Future<void> addNewTask(Task task) {
    _tasks.add(task);
    return _tasksBox.put('tasks', _tasks);
  }

  Future<void> addToArchievedTask(Task task) {
    _tasks.removeWhere((t) => t.id == task.id);
    _archievedTasks.add(task);

    _tasksBox.put('tasks', _tasks);
    return _tasksBox.put('archievedTasks', _archievedTasks);
  }

  Future<void> deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    return _tasksBox.put('tasks', _tasks);
  }

  Future<void> unarchiveTask(Task task) {
    _archievedTasks.removeWhere((t) => t.id == task.id);
    _tasks.add(task);

    _tasksBox.put('archievedTasks', _archievedTasks);
    return _tasksBox.put('tasks', _tasks);
  }

  // List<Task> getAllTasks() {
  //   _tasks = _tasksBox.get('tasks');
  //   return _tasks;
  // }

  // List<Task> getArchievedTasks() {
  //   _archievedTasks = _tasksBox.get('archievedTasks');
  //   return _archievedTasks;
  // }
}
