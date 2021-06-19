import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textEditingController = TextEditingController();
  List<String> todoItems = [];
  String todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tasks",
            style: TextStyle(color: Colors.green[900], fontSize: 20)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialogFunction();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onLongPress: () {
                setState(() {
                  todoItems.removeAt(index);
                });
              },
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(todoItems[index]),
                ),
              ),
            );
          }),
    );
  }

  void showDialogFunction() {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              "Add Todo",
            ),
            actions: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        todo = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            todoItems.add(todo);
                          });

                          print(todoItems);

                          Navigator.pop(context);
                        },
                        child: Text("Add")),
                  ),
                ],
              )
            ],
          );
        });
  }
}
