import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngicon_task/screen/pages/project_detatils_page.dart';

List<String> listOfPage = ['Projects', 'Tasks', 'Employees', 'Progress'];

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
            listOfPage.length,
            (index) => ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailsPage(),
                      )),
                  leading: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  // onTap: () => Det,
                  title: Text(
                    listOfPage[index],
                  ),
                )),
      ),
    );
  }
}
