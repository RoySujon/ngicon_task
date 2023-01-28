import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngicon_task/model/model_class.dart';
import 'package:readmore/readmore.dart';

import '../utls/const.dart';

class DetailsScreen extends StatefulWidget {
  // final ModelClass modelClass;
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int? ml2 = 2;
  TextOverflow? of2 = TextOverflow.ellipsis;
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Project Details'),
      ),
      body: Column(
        children: [
          sboxH16,
          Padding(
            padding: horizontal16,
            child: Container(
              width: double.maxFinite,
              padding: all16,
              decoration: BoxDecoration(
                  color: kMain2, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heaingText('Task Name', fontSize: 24),
                  sboxH8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Icon(Icons.circle, size: 12, color: Colors.red),
                      sboxW8,
                      heaingText('10 Task', fontSize: 12),
                    ],
                  ),
                  sboxH8,
                  heaingText('Details...', fontSize: 16),
                  sboxH8,
                  ReadMoreText(
                    'Flutter is Google\’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase Flutter is Google\’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase  ',
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    style: TextStyle(fontSize: 14, height: 1.5, color: kLabel),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  sboxH16,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 18,
                            ),
                            sboxW8,
                            heaingText('Starting Time', fontSize: 12)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.departure_board_outlined,
                              size: 18,
                            ),
                            sboxW8,
                            heaingText('Deadline 444', fontSize: 12)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          sboxH16,
          Expanded(
              child: Padding(
            padding: horizontal16,
            child: Container(
              color: kMain2,
              child: Column(
                // shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: all16,
                    child: Row(
                      children: [
                        heaingText('Tasks (12/12)', fontSize: 16),
                        sboxW8,
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 16,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff363748)),
                                // color: Colors.red,
                              ),
                              LayoutBuilder(
                                builder: (context, BoxConstraints) => Container(
                                  width: BoxConstraints.maxWidth * 10 / 20,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff9C67F9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 300,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kMain,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    index < 9
                                        ? ('0' + '${index + 1}').toString()
                                        : ('${index + 1}').toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                sboxW8,
                                Expanded(
                                  child: heaingText('Name of the Task',
                                      ml: 1, of: TextOverflow.ellipsis),
                                ),
                                sboxW8,
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 60,
                                      child: TextField(
                                        style: TextStyle(color: kLabel),
                                        decoration: InputDecoration(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('%'),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: Text('Comment'),
                                                content: TextField(
                                                  style:
                                                      TextStyle(color: kLabel),
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          kMain))),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel')),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text('Submite')),
                                                ]),
                                          );
                                        },
                                        icon: Icon(Icons.note_alt_outlined)),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Submite')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          itemCount: 20,
                          separatorBuilder: (context, index) => sboxH16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  bool valuefirst = false;
}
