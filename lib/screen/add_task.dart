import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ngicon_task/model/add_task_class.dart';
import 'package:ngicon_task/screen/task_allocations.dart';

import '../utls/const.dart';
import '../utls/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskNameController = TextEditingController();
  final detailsController = TextEditingController();
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

  TimeOfDay? _startTime;

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

  TimeOfDay? _endtTime;
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

  @override
  void initState() {
    super.initState();
  }

  late String dropdownValue = taskManager.first;
  String projectvalue = projectList.first;
  String stepNoValue = stepNo.first;
  void startCount(String data) {
    // int endtime = _endtTime as int;
    Timer.periodic(Duration(seconds: 1), (timer) {
      print(Text(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(dropdownValue);
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  // width: 120,
                  constraints: BoxConstraints(minWidth: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heaingText('Select Project', fontSize: 18),
                      Text(':'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    // underline: Divider(),
                    // hint: Text('data'),
                    value: projectvalue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    dropdownColor: kMain2,
                    // : kMain2,
                    isExpanded: true,
                    // iconEnabledColor: kMain,
                    focusColor: kMain,
                    style: TextStyle(color: kLabel),
                    // underline: Container(height: 1, color: kMainColor),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        projectvalue = value!;
                        print(projectvalue);
                      });
                    },
                    items: projectList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: taskNameController, title: 'task Name',
              hints: 'task Name',
              // maxLine: 4,
              // maxLength: 200,
            ),
            sboxH16,
            CustomTextField(
              controller: detailsController,
              hints: 'task details',
              title: 'Details',
              maxLine: 3,
              maxLength: 30,
            ),
            sboxH16,
            // sboxH16,

            sboxH16,
            Row(
              children: [
                Container(
                  // width: 120,
                  constraints: BoxConstraints(minWidth: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heaingText('No of Step', fontSize: 18),
                      Text(':'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    // underline: Divider(),
                    // hint: Text('data'),
                    value: stepNoValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    dropdownColor: Colors.deepPurpleAccent,
                    isExpanded: true,
                    // iconEnabledColor: kMain,
                    // focusColor: kMain,
                    style: TextStyle(color: kLabel),
                    underline:
                        Container(height: 1, color: Colors.deepPurpleAccent),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        stepNoValue = value!;
                        print(stepNoValue);
                      });
                    },
                    items: stepNo.map((String value) {
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
            CustomDropDownMenue(
              value: dropdownValue,
              list: taskManager,
              title: 'Manager',
            ),
            sboxH16,
            // Spacer(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selected == 0 ? Colors.deepPurpleAccent : kMain2),
                      onPressed: () {
                        selected = 0;
                        setState(() {});
                      },
                      child: Text('Daily')),
                ),
                sboxW16,
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selected == 1 ? Colors.deepPurpleAccent : kMain2),
                      onPressed: () {
                        selected = 1;
                        setState(() {});
                      },
                      child: Text('WeekLy')),
                ),
                sboxW16,
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selected == 2 ? Colors.deepPurpleAccent : kMain2),
                      onPressed: () {
                        selected = 2;
                        setState(() {});
                      },
                      child: Text('Monthly')),
                ),
              ],
            ),
            selected == 0
                ? Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sboxH16,
                      ListTile(
                        trailing: Text('Start Time'),
                        // tileColor: kMain2,
                        onTap: () {
                          startTime();
                        },
                        contentPadding: all16,
                        title: Text(_startTime == null
                            ? TimeOfDay.now().format(context)
                            : _startTime!.format(context)),
                        leading: Icon(
                          Icons.watch_later_outlined,
                          color: kLabel,
                        ),
                      ),
                      sboxH16,
                      ListTile(
                        contentPadding: all16,
                        trailing: Text('End Time'),
                        // tileColor: kMain2,
                        onTap: () {
                          endTime();
                        },
                        title: Text(_endtTime == null
                            ? TimeOfDay.now().format(context)
                            : _endtTime!.format(context)),
                        leading: Icon(
                          Icons.watch_later_outlined,
                          color: kLabel,
                        ),
                      ),
                    ],
                  )
                : selected == 1
                    ? Column(
                        children: [
                          sboxH16,
                          CheckboxListTile(
                            // tileColor: kMain,
                            title: Text('Saturday'),
                            value: saturday,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                saturday = value!;
                                print(saturday);
                              });
                            },
                          ),
                          sboxH16,
                          customCheckbox(day: 'Sunday', val: sunday),
                          sboxH16,
                          customCheckbox(day: 'Monday', val: moneday),
                          sboxH16,
                          customCheckbox(day: 'Tuesday', val: tuesday),
                          sboxH16,
                          customCheckbox(day: 'Wednessday', val: wednessday),
                          sboxH16,
                          customCheckbox(day: 'Thursday', val: thursday),
                          // sboxH16,
                        ],
                      )
                    : Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          sboxH16,
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
            // Spacer(),
            sboxH16,
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
                            builder: (context) => TaskAllocation(),
                          ));
                    },
                    child: heaingText('Next')),
              ],
            ),
          ],
        ),
      ),
      // backgroundColor: kMain2,
    );
  }

  int selected = 0;
  bool week = true;
  customCheckbox({required String day, required bool val}) {
    return CheckboxListTile(
      // tileColor: kMain,
      title: Text(day),
      value: val,
      onChanged: (value) {
        print(value);
        setState(() {
          val = value!;
          print(val);
        });
      },
    );
  }

  // bool? abc;
  bool saturday = false;
  bool sunday = false;
  bool moneday = false;
  bool tuesday = false;
  bool wednessday = false;
  bool thursday = false;

  int select = 0;
}

class CustomDropDownMenue extends StatefulWidget {
  late String value;
  final List<String> list;
  final String title;
  CustomDropDownMenue(
      {super.key,
      required this.value,
      required this.list,
      required this.title});

  @override
  State<CustomDropDownMenue> createState() => _CustomDropDownMenueState();
}

class _CustomDropDownMenueState extends State<CustomDropDownMenue> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heaingText(widget.title, fontSize: 18),
              Text(':'),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: DropdownButton<String>(
            // underline: Divider(),
            // hint: Text('data'),
            value: widget.value,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            dropdownColor: Colors.deepPurpleAccent,
            isExpanded: true,
            // iconEnabledColor: kMain,
            // focusColor: kMain,
            style: TextStyle(color: kLabel),
            underline: Container(height: 1, color: Colors.deepPurpleAccent),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                widget.value = value!;
              });
            },
            items: widget.list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
