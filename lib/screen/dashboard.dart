import 'package:flutter/material.dart';
import 'package:ngicon_task/model/model_class.dart';
import 'package:ngicon_task/screen/details_page.dart';
import 'package:ngicon_task/utls/const.dart';

// import '../utls/const.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final modelClass = ModelClass.projectList;
  final controller = TextEditingController(text: '0');
  int count = 0;
  int total = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DashBoard'),
      ),
      body: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* TextField(
            keyboardType: TextInputType.number,
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                int i = int.parse(controller.text);
                print(i);
                final snackBar = SnackBar(
                  content: const Text('Value is So high'),
                  backgroundColor: (Colors.red),
                  action: SnackBarAction(
                    label: 'dismiss',
                    onPressed: () {},
                  ),
                );

                i <= total
                    ? count = i
                    : ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // count > 0 ? count-- : null;

                snackBar;
                setState(() {});
              },
              child: Text('Submmit')), */
          sboxH16,
          Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          InkWell(child: customTab(index)),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: 5),
                ),
              )),
          sboxH16,
          Padding(
            padding: horizontal16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                heaingText('GOUTOM', fontSize: 16, fontWeight: FontWeight.w700),
                heaingText('See More',
                    fontSize: 16, fontWeight: FontWeight.w700),
              ],
            ),
          ),
          sboxH16,
          Padding(
              padding: horizontal16,
              child: ListView.separated(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => CustomCard(
                  modelClass: modelClass[index],
                ),
                itemCount: modelClass.length,
                separatorBuilder: (BuildContext context, int index) {
                  return sboxH8;
                },
              )),
        ],
      ),
    );
  }

  Stack customTab(int index) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '5',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(width: 5),
              Text(
                'Ongoing',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
            top: 10,
            bottom: 10,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index.isOdd ? Colors.red : Colors.green,
              ),
              width: 6,
            ))
      ],
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.modelClass,
  }) : super(key: key);

  final ModelClass modelClass;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final count = CountModel.count;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(),
            ));
      },
      child: Container(
        // height: 150,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
          color: kMain2,
        ),
        padding: all16,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.modelClass.taskdDone == widget.modelClass.toalTask
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined),
            sboxW8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heaingText(widget.modelClass.projectName,
                          fontSize: 14, fontWeight: FontWeight.w600),
                      Container(
                        constraints: BoxConstraints(maxWidth: 150),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.shade100),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: heaingText(widget.modelClass.status,
                            fontSize: 14,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  heaingText(widget.modelClass.taskName,
                      fontSize: 14, fontWeight: FontWeight.w600),
                  sboxH8,
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 12,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff363748)),
                              // color: Colors.red,
                            ),
                            LayoutBuilder(
                              builder: (context, BoxConstraints) => Container(
                                width: BoxConstraints.maxWidth *
                                    widget.modelClass.taskdDone /
                                    widget.modelClass.toalTask,
                                height: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff9C67F9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 60,
                          child: Center(
                              child: Text(
                                  '${widget.modelClass.taskdDone}/${widget.modelClass.toalTask}')))
                    ],
                  ),
                  /* Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count.count > 0 ? count.count-- : null;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      sboxW16,
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.modelClass.taskdDone <
                                    widget.modelClass.toalTask
                                ? widget.modelClass.taskdDone++
                                : null;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ), */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
