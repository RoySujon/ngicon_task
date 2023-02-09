// import 'package:flutter/material.dart';

class ModelClass {
  final String projectName, taskName, status;
  final int toalTask;
  late final int taskdDone;
  final List<CheckBoxList> taskCheck;

  ModelClass({
    required this.projectName,
    required this.status,
    required this.taskName,
    required this.toalTask,
    required this.taskdDone,
    required this.taskCheck,
  });

  static List<ModelClass> projectList = [
    ModelClass(
      projectName: 'Web Development',
      status: 'Ongoing',
      taskName: 'taskName',
      toalTask: 20,
      taskdDone: 10,
      taskCheck: [
        CheckBoxList(taskName: '272u', time: DateTime.now(), Checkbox: false),
        CheckBoxList(taskName: '272u', time: DateTime.now(), Checkbox: false),
        CheckBoxList(taskName: '272u', time: DateTime.now(), Checkbox: false),
        CheckBoxList(taskName: '272u', time: DateTime.now(), Checkbox: false),
        CheckBoxList(taskName: '272u', time: DateTime.now(), Checkbox: false),
      ],
    ),
    ModelClass(
      projectName: 'Web Design',
      status: 'Ongoing',
      taskName: 'taskName',
      toalTask: 20,
      taskdDone: 10,
      taskCheck: [
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
        CheckBoxList(
            taskName: 'gdhdoi3', time: DateTime.now(), Checkbox: false),
      ],
    ),
  ];
}

class Count {
  int count;
  Count({required this.count});
}

class CountModel {
  static Count count = Count(count: 0);
}

class CheckBoxList {
  final String taskName;
  DateTime time;
  bool Checkbox;

  CheckBoxList(
      {required this.taskName, required this.time, required this.Checkbox});
}
