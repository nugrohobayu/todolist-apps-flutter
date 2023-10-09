import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_apps/components/c_button.dart';
import 'package:todolist_apps/components/c_text_field.dart';

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
  TextEditingController ctrlTitle = TextEditingController();
  TextEditingController ctrlDetail = TextEditingController();
  var formattedDate = DateFormat('yMMMMd');
  List<TodoListModel> todoList = [
    TodoListModel(
      title: "Learning Dart",
      detail: "Basic dart ",
      status: false,
    ),
    TodoListModel(
      title: "Learning Flutter",
      detail: "Basic flutter ",
      status: false,
    ),
  ];

  addList(
    String titleList,
    String detailList,
  ) {
    todoList.add(TodoListModel(
      title: titleList,
      detail: detailList,
      status: false,
    ));
  }

  clearList(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);

    dialogAddList() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            content: SizedBox(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Add your to do list"),
                      SizedBox(height: mediaQuery.size.height * 0.05),
                      CTextField(
                        name: 'Title',
                        ctrl: ctrlTitle,
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.05),
                      CTextField(
                        name: 'Detail',
                        ctrl: ctrlDetail,
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.08),
                      CButton(
                        name: 'Create',
                        onPressed: () {
                          setState(() {
                            addList(ctrlTitle.text, ctrlDetail.text);
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    checkedList() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Checked tasks :",
            style: TextStyle(color: color.primary),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final TodoListModel todo = todoList[index];
                return todo.status == true
                    ? Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: mediaQuery.size.width * 0.1,
                              child: Checkbox(
                                value: todo.status,
                                onChanged: (value) {
                                  setState(() {
                                    todo.status = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: mediaQuery.size.width * 0.7,
                              child: Column(
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
                                        todo.detail,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      SizedBox(
                                          width: mediaQuery.size.width * 0.01),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  clearList(index);
                                });
                              },
                              child: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      )
                    : const Center();
              }),
        ],
      );
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
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: mediaQuery.size.width * 0.1,
                          child: Checkbox(
                            value: todo.status,
                            onChanged: (value) {
                              setState(() {
                                todo.status = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(todo.detail),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              clearList(index);
                            });
                          },
                          child: const Icon(Icons.delete),
                        )
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
        padding: const EdgeInsets.all(16),
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
          dialogAddList();
        },
      ),
    );
  }
}
