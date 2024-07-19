import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> taskTitles = [
    'Understand Code',
    'Figure out duplication',
    'Refactor',
    'Add comments',
    'commit code',
    'push to github',
  ];

  List<bool> taskStates = [
    true,
    false,
    true,
    false,
    false,
    false,
  ];

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
          itemCount: taskTitles.length,
          itemBuilder: (context, index) {
            return Task(
              title: taskTitles[index],
              checked: taskStates[index],
              onChanged: (newValue) {
                setState(() {
                  taskStates[index] = newValue;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String title;
  final bool checked;
  final ValueChanged<bool> onChanged;

  Task({@required this.title, @required this.checked, @required this.onChanged});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.checked,
        onChanged: widget.onChanged,
        activeColor: Colors.teal,
        title: Text(widget.title,
            style: TextStyle(
              fontSize: 20,
              fontStyle: widget.checked ? FontStyle.italic : FontStyle.normal,
              color: widget.checked ? Colors.grey : Colors.black,
            )),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
