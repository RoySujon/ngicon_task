import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngicon_task/screen/add_project.dart';
import 'package:ngicon_task/utls/const.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(filled: true, fillColor: kLabel),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Column(
        children: List.generate(
            select,
            (index) => ListTile(
                  leading: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  title: Row(
                    children: [
                      Expanded(child: Text('project Name')),
                      InkWell(
                          onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => AddProjectScreen(),
                              ),
                          child: Icon(Icons.edit)),
                      sboxW8
                    ],
                  ),
                  trailing: InkWell(
                      onTap: () {
                        setState(() {
                          select--;
                        });
                      },
                      child: Icon(Icons.delete)),
                )),
      ),
    );
  }

  int select = 10;
}
