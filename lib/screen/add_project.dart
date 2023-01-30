import 'package:flutter/material.dart';

import 'package:ngicon_task/utls/const.dart';
import 'package:jiffy/jiffy.dart';

import '../model/add_task_class.dart';
import '../utls/custom_text_field.dart';
import 'add_task.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  DateTime? startDate;
  Future<void> _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

        // keyboardType: TextInputType.datetime,
        // fieldHintText: 'dkdkdkk',
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime(2022, 11, 11),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());
    // if (picked != null && picked != selectedDate) {
    setState(() {
      startDate = picked;
      // datePic = picked;
    });
    // }
  }

  DateTime? endDate;
  Future<void> _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

        // keyboardType: TextInputType.datetime,
        // fieldHintText: 'dkdkdkk',
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime(2022, 11, 11),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());
    // if (picked != null && picked != selectedDate) {
    setState(() {
      endDate = picked;
      // datePic = picked;
    });
    // }
  }

  final projectNameController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: projectNameController, title: 'task Name',
              hints: 'project Name',
              // maxLine: 4,
              // maxLength: 200,
            ),
            sboxH8,
            CustomTextField(
              controller: descriptionController,
              hints: 'project description',
              title: 'Details',
              maxLine: 3,
              maxLength: 30,
            ),
            sboxH8,
            // sboxH16,
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: all16,
                  trailing: Text('Starting Day'),
                  // tileColor: kMain2,
                  onTap: () {
                    _startDate(context);
                  },
                  title: startDate == null
                      ? SizedBox()
                      : heaingText(
                          Jiffy(startDate).format("do MMM yyyy"),
                          color: kLabel,
                        ),
                  leading: Icon(
                    Icons.calendar_month_outlined,
                    color: kLabel,
                  ),
                ),
                sboxH16,
                ListTile(
                  contentPadding: all16,
                  trailing: Text('Ending Day'),
                  // tileColor: kMain2,
                  onTap: () {
                    _endDate(context);
                  },
                  title: endDate == null
                      ? SizedBox()
                      : heaingText(
                          Jiffy(endDate).format("do MMM yyyy"),
                          color: kLabel,
                        ),
                  leading: Icon(
                    Icons.calendar_month_outlined,
                    color: kLabel,
                  ),
                ),
              ],
            ),
            sboxH8,
            Row(
              children: [
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heaingText('Manager', fontSize: 18),
                      Text(':'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    // underline: Divider(),
                    // hint: Text('data'),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    dropdownColor: Colors.deepPurpleAccent,
                    isExpanded: true,
                    iconEnabledColor: Colors.deepPurpleAccent,
                    // focusColor: kMain,
                    style: TextStyle(color: kLabel),
                    underline:
                        Container(height: 1, color: Colors.deepPurpleAccent),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        print(dropdownValue);
                      });
                    },
                    items: managerList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            sboxH16,
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
                            builder: (context) => AddTaskScreen(),
                          ));
                    },
                    child: heaingText('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String dropdownValue = managerList.first;
}
