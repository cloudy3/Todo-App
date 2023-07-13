import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange.shade800,
      child: Row(
        children: <Widget>[
          Container(
            width: 10,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black54),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.black54),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/add_item.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 25.0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your Task',
                              ),
                              controller: _controller,
                            ),
                          ),
                        ),
                        CustomAddButton(
                          icon: FlutterIcons.add_to_list_ent,
                          ontap: () {
                            Provider.of<TaskData>(context, listen: false)
                                .addTask(_controller.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
