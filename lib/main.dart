import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        tasks: [
          TaskModel(title: 'Understand Code', checked: true),
          TaskModel(title: 'Figure out duplication', checked: false),
          TaskModel(title: 'Refactor', checked: true),
          TaskModel(title: 'Add comments', checked: false),
          TaskModel(title: 'Commit code', checked: false),
          TaskModel(title: 'Push to GitHub', checked: false),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<TaskModel> tasks;

  MyHomePage({Key key, @required this.tasks}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Your Tasks'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.teal,
        child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (context, index) {
            return Task(
              task: widget.tasks[index],
              onChanged: (newValue) {
                setState(() {
                  widget.tasks[index].checked = newValue;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final TaskModel task;
  final ValueChanged<bool> onChanged;

  Task({@required this.task, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: task.checked,
        onChanged: onChanged,
        activeColor: Colors.teal,
        title: Text(task.title,
            style: TextStyle(
              fontSize: 20,
              fontStyle: task.checked ? FontStyle.italic : FontStyle.normal,
              color: task.checked ? Colors.grey : Colors.black,
            )),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

class TaskModel {
  String title;
  bool checked;

  TaskModel({@required this.title, @required this.checked});
}
