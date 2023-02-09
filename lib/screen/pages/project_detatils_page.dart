import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngicon_task/screen/add_project.dart';
import 'package:ngicon_task/utls/const.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
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

  TextEditingController _searchingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        // centerTitle: true,
        title: Row(
          children: [
            Expanded(
              child: startDate == null && endDate == null
                  ? TextField(
                      controller: _searchingController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: kLabel,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kMain),
                              borderRadius: BorderRadius.circular(15))),
                    )
                  : Row(
                      children: [
                        startDate == null
                            ? SizedBox()
                            : heaingText(
                                Jiffy(startDate).format("d/M/yy"),
                                color: kLabel,
                              ),
                        SizedBox(
                          child: startDate != null && endDate != null
                              ? Text(' To ')
                              : SizedBox(),
                        ),
                        endDate == null
                            ? SizedBox()
                            : Row(
                                children: [
                                  heaingText(
                                    Jiffy(endDate).format("d/M/yy"),
                                    color: kLabel,
                                  ),
                                ],
                              ),
                      ],
                    ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    startDate = null;
                    endDate = null;
                  });
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  _startDate(context);
                },
                icon: Icon(Icons.date_range_outlined)),
            IconButton(
                onPressed: () {
                  _endDate(context);
                },
                icon: Icon(Icons.date_range_outlined)),
          ],
        ),
        // actions: [],
      ),
      body: Column(
        children: List.generate(
            select,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: ListTile(
                    // tileColor: kMain2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),

                    leading: Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 30),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'This is our subtitle....',
                        style: TextStyle(color: kLabel),
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(child: Text('project Name')),
                      ],
                    ),
                    // isThreeLine: true,
                    // visualDensity: VisualDensity.adaptivePlatformDensity,
                    horizontalTitleGap: 0,
                    // visualDensity: VisualDensity.comfortable,

                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => AddProjectScreen(),
                                  ),
                              icon: Icon(Icons.edit)),
                          // sboxW8,
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  select--;
                                });
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  int select = 10;
}
