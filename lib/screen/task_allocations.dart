import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngicon_task/screen/add_task.dart';
import 'package:ngicon_task/screen/dashboard.dart';
import 'package:ngicon_task/utls/const.dart';

import '../model/add_task_class.dart';

class TaskAllocation extends StatefulWidget {
  const TaskAllocation({super.key});

  @override
  State<TaskAllocation> createState() => _TaskAllocationState();
}

class _TaskAllocationState extends State<TaskAllocation> {
  String taskValue = taskManager.first;
  String employee = employeeList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Allocation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomDropDownMenue(
                value: taskValue, list: taskManager, title: 'Task'),
            CustomDropDownMenue(
                value: employee, list: employeeList, title: 'Employee'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: heaingText('Back')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashBoardScreen(),
                          ));
                    },
                    child: heaingText('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
