import 'package:flutter/material.dart';
import 'package:myapp/Models/model.dart';
class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextField(
                onChanged:(text){
                  setState(() {

                  });
                },
                controller: con,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          RaisedButton(
            child: (Icon(Icons.add_box)),
            onPressed: con.value.text.isEmpty
                ? null
                : () {
                    Task newTask=new Task(id:2,title:con.value.text,status: false);
                    print(newTask.title);
                    con.clear();
                  },
          )
        ],
      ),
    );
  }
}
