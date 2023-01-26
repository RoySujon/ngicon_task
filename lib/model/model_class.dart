class ModelClass {
  final String projectName, taskName, status;
  final int toalTask;

  ModelClass({
    required this.projectName,
    required this.status,
    required this.taskName,
    required this.toalTask,
  });

  static List<ModelClass> projectList = [
    ModelClass(
        projectName: 'Goutom Roy',
        status: 'Ongoing',
        taskName: 'taskName',
        toalTask: 20),
    ModelClass(
        projectName: 'projectName',
        status: 'Processing',
        taskName: 'taskName',
        toalTask: 10),
    ModelClass(
        projectName: 'projectName',
        status: 'OnComming',
        taskName: 'taskName',
        toalTask: 20),
  ];
}

class Count {
  int count;
  Count({required this.count});
}

class CountModel {
  static Count count = Count(count: 0);
}
