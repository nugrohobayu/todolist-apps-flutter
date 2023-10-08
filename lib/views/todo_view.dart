import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo_list_model.dart';

class TodoView extends StatefulWidget {
  final String name;
  const TodoView({Key? key, required this.name}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  bool isChecked = false;
  DateTime now = DateTime.now();
  var formattedDate = DateFormat('yMMMMd');
  List<TodoListModel> todoList = [
    TodoListModel(
      title: "Learning Dart",
      location: "Univ Bhayangkara",
      date: "startDate",
      status: false,
    ),
    TodoListModel(
      title: "Learning Flutter",
      location: "Univ Bhayangkara",
      date: "startDate",
      status: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);

    checkedList() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final TodoListModel todo = todoList[index];
            return todo.status == true
                ? Card(
                    child: Row(
                      children: [
                        Checkbox(
                          value: todo.status,
                          onChanged: (value) {
                            setState(() {
                              todo.status = value!;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.title,
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Row(
                              children: [
                                Text(
                                  todo.date,
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(width: mediaQuery.size.width * 0.01),
                                Text(
                                  "at ${todo.location}",
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
          });
    }

    unCheckedList() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final TodoListModel todo = todoList[index];
            return todo.status == false
                ? Card(
                    child: Row(
                      children: [
                        Checkbox(
                          value: todo.status,
                          onChanged: (value) {
                            setState(() {
                              todo.status = value!;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todo.title),
                            Row(
                              children: [
                                Text(todo.date),
                                SizedBox(width: mediaQuery.size.width * 0.01),
                                Text("at ${todo.location}"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.secondary,
        elevation: 1,
        toolbarHeight: mediaQuery.size.height * 0.08,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.onSecondary,
              backgroundImage: const NetworkImage(
                'https://robohash.org/autquiaut.png?size=50x50&set=set1',
              ),
            ),
            const SizedBox(width: 16),
            Text(
              "Hi, ${widget.name}",
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                formattedDate.format(now).toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: color.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "To do list",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: color.primary,
                ),
              ),
            ),
            unCheckedList(),
            Divider(
              height: 20,
              color: color.primary,
            ),
            checkedList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.deepOrange,
        ),
        onPressed: () {
          print("object");
        },
      ),
    );
  }
}
