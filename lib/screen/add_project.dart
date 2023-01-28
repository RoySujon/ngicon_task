import 'package:flutter/material.dart';

import 'package:ngicon_task/utls/const.dart';
import 'package:jiffy/jiffy.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TimeOfDay? _startTime;
  TimeOfDay? _endtTime;

  void startTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    if (newTime != null) {
      setState(() {
        _startTime = newTime;
      });
    }
  }

  void endTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    if (newTime != null) {
      setState(() {
        _endtTime = newTime;
      });
    }
  }

  final taskNameController = TextEditingController();
  final detailsController = TextEditingController();
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
              controller: taskNameController, title: 'task Name',
              hints: 'task Name',
              // maxLine: 4,
              // maxLength: 200,
            ),
            sboxH8,
            CustomTextField(
              controller: detailsController,
              hints: 'task details',
              title: 'Details',
              maxLine: 3,
            ),
            sboxH8,
            // sboxH16,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      heaingText('Start:', fontSize: 18),
                      IconButton(
                          onPressed: () {
                            startTime();
                          },
                          icon: Icon(Icons.watch_later_outlined)),
                      Text(_startTime == null
                          ? TimeOfDay.now().format(context)
                          : _startTime!.format(context)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      heaingText('End:', fontSize: 18),
                      IconButton(
                          onPressed: () {
                            endTime();
                          },
                          icon: Icon(Icons.watch_later_outlined)),
                      Text(_startTime == null
                          ? TimeOfDay.now().format(context)
                          : _startTime!.format(context)),
                    ],
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
                    dropdownColor: kMain2,
                    isExpanded: true,
                    // iconEnabledColor: kMain,
                    focusColor: kMain,
                    style: TextStyle(color: kLabel),
                    // underline: Container(height: 1, color: kMainColor),
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
          ],
        ),
      ),
    );
  }

  String dropdownValue = managerList.first;
}

final List<String> managerList = [
  for (int i = 0; i < 5; i++) 'Manager  ' + (i + 1).toString()
];

class CustomTextField extends StatelessWidget {
  final String? hints, title;
  final int? maxLine, maxLength;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hints,
    this.title,
    this.maxLine,
    required this.controller,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heaingText('${title ?? 'Title'}', fontSize: 18),
              Text(':'),
            ],
          ),
        ),
        sboxW8,
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: maxLine,
            minLines: maxLine,
            maxLength: maxLength,
            decoration: InputDecoration(
                // alignLabelWithHint: true,
                hintText: 'Enter ${hints ?? 'hints..'}',
                hintStyle: TextStyle(color: kLabel, fontSize: 14),
                filled: true,
                fillColor: kMain2),
          ),
        ),
      ],
    );
  }
}
